//
//  RxIGListAdapterDataSource.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 28/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxCocoa
import RxSwift

protocol RxListAdapterDataSourceType {
    associatedtype Element
    func listAdapter(_ adapter: ListAdapter, observedEvent: Event<Element>)
}

open class RxListAdapterDataSource<M: Diffable>: NSObject, ListAdapterDataSource {

    public typealias ConfigureSectionController =
        (RxListAdapterDataSource<M>, ListAdapter, M) -> ListSectionController
    public typealias ConfigureEmptyView =
        (RxListAdapterDataSource<M>, ListAdapter) -> UIView?

    public init(
        configureSectionController: @escaping ConfigureSectionController,
        configureEmptyView: ConfigureEmptyView? = nil
        ) {
        self.configureSectionController = configureSectionController
        self.configureEmptyView = configureEmptyView
    }

    private var models: [M] = []
    private let configureSectionController: ConfigureSectionController
    private let configureEmptyView: ConfigureEmptyView?

    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return models.map({ $0.listDiffable })
    }

    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        guard let diffableBox = object as? DiffableBox<M>
            else {
                fatalError()
        }
        let diffable = diffableBox.diffable
        return configureSectionController(self, listAdapter, diffable)
    }

    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return configureEmptyView?(self, listAdapter)
    }

    open func setModels(_ models: [M]) {
        self.models = models
    }
}

open class BaseRxListAdapterDataSource<M: Diffable>: RxListAdapterDataSource<M>, RxListAdapterDataSourceType {

    typealias Element = [M]

    func listAdapter(_ adapter: ListAdapter, observedEvent: Event<Element>) {
        Binder(self) { dataSource, models in
            dataSource.setModels(models)
            adapter.performUpdates(animated: true)
        }
            .on(observedEvent)
    }
}

extension Reactive where Base: ListAdapter {
    func items<DataSource: RxListAdapterDataSourceType & ListAdapterDataSource, O: ObservableType>
        (dataSource: DataSource)
        -> (_ source: O)
        -> Disposable where DataSource.Element == O.E {

            return { source in
                let object = self.base
                let proxy = RxListAdapterDataSourceProxy.proxy(for: object)
                let unregisterDataSource = RxListAdapterDataSourceProxy
                    .installForwardDelegate(dataSource, retainDelegate: true, onProxyForObject: object)

                let subscription = source.asObservable()
                    .observeOn(MainScheduler())
                    .catchError({ error in
                        bindingError(error)
                        return .empty()
                    })
                    // source can never end, otherwise it would release the subscriber, and deallocate the data source
                    .concat(Observable.never())
                    .takeUntil(object.rx.deallocated)
                    .subscribe { [weak object] event in
                        if let object = object {
                            // swiftlint:disable line_length
                            assert(
                                proxy === RxListAdapterDataSourceProxy.currentDelegate(for: object),
                                "Proxy changed from the time it was first set.\nOriginal: \(proxy)\nExisting: \(String(describing: RxListAdapterDataSourceProxy.currentDelegate(for: object)))"
                            )
                        }

                        if let listAdapter = object {
                            dataSource.listAdapter(listAdapter, observedEvent: event)
                        }

                        switch event {
                        case let .error(error):
                            bindingError(error)
                            unregisterDataSource.dispose()
                        case .completed:
                            unregisterDataSource.dispose()
                        default:
                            break
                        }
                    }

                return Disposables.create(subscription, unregisterDataSource)
            }
    }
}
