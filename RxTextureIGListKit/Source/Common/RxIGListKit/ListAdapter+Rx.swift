//
//  ListAdapter+Rx.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 28/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxCocoa
import RxSwift

extension Reactive where Base: ListAdapter {
    public var dataSource: DelegateProxy<ListAdapter, ListAdapterDataSource> {
        return RxListAdapterDataSourceProxy.proxy(for: base)
    }

    public func setDataSource(_ dataSource: ListAdapterDataSource)
        -> Disposable {
            return RxListAdapterDataSourceProxy
                .installForwardDelegate(
                    dataSource,
                    retainDelegate: true,
                    onProxyForObject: self.base
            )
    }

    public func items<DataSource: RxListAdapterDataSourceType & ListAdapterDataSource, O: ObservableType>
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
