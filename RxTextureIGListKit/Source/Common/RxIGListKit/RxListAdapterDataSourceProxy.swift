//
//  RxListAdapterDataSourceProxy.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 28/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxCocoa
import RxSwift

private let listAdapterDataSourceNotSet = ListAdapterDataSourceNotSet()

private final class ListAdapterDataSourceNotSet: NSObject,
    ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return []
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ListSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension ListAdapter: HasDataSource {
    public typealias DataSource = ListAdapterDataSource
}

open class RxListAdapterDataSourceProxy: DelegateProxy<ListAdapter, ListAdapterDataSource>,
    DelegateProxyType,
    ListAdapterDataSource {

    /// Typed parent object.
    public weak private(set) var listAdapter: ListAdapter?

    /// - parameter collectionView: Parent object for delegate proxy.
    public init(listAdapter: ParentObject) {
        self.listAdapter = listAdapter
        super.init(parentObject: listAdapter, delegateProxy: RxListAdapterDataSourceProxy.self)
    }

    public static func registerKnownImplementations() {
        self.register { RxListAdapterDataSourceProxy(listAdapter: $0) }
    }

    private weak var _requiredMethodsDataSource: ListAdapterDataSource? = listAdapterDataSourceNotSet

    private var dataSource: ListAdapterDataSource { return (_requiredMethodsDataSource ?? listAdapterDataSourceNotSet) }

    open override func setForwardToDelegate(_ forwardToDelegate: ListAdapterDataSource?, retainDelegate: Bool) {
        _requiredMethodsDataSource = forwardToDelegate ?? listAdapterDataSourceNotSet
        super.setForwardToDelegate(forwardToDelegate, retainDelegate: retainDelegate)
    }

    public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return dataSource.objects(for: listAdapter)
    }

    public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return dataSource.listAdapter(listAdapter, sectionControllerFor: object)
    }

    public func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return dataSource.emptyView(for: listAdapter)
    }
}
