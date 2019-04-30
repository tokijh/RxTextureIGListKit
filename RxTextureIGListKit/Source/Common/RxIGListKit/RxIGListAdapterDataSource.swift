//
//  RxIGListAdapterDataSource.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 28/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxSwift

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
