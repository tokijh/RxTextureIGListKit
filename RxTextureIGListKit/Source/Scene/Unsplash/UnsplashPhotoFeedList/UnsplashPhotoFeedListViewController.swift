//
//  UnsplashPhotoFeedListViewController.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import AsyncDisplayKit
import ReactorKit
import RxCocoa
import RxSwift

import IGListKit

final class UnsplashPhotoFeedListViewController: ASViewController<ASCollectionNode>, View, FactoryModule {

    // MARK: - Typeaslias

    typealias Reactor = UnsplashPhotoFeedListViewReactor

    // MARK: - Property

    var disposeBag = DisposeBag()

    private lazy var listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)

    // MARK: - Lifecycle

    convenience init(dependency: Dependency) {
        let node = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
        self.init(node: node)
        self.reactor = dependency.reactor
    }

    override init(node: ASCollectionNode) {
        super.init(node: node)
        node.backgroundColor = .white
        node.automaticallyManagesSubnodes = true
        node.automaticallyRelayoutOnSafeAreaChanges = true

        listAdapter.dataSource = self
        listAdapter.setASDKCollectionNode(node)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Reactor

    func bind(reactor: Reactor) {

    }
}

extension UnsplashPhotoFeedListViewController: ListAdapterDataSource {
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return UnsplashPhotoFeedSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return (0..<10).map({ "\($0)" as ListDiffable })
    }
}

// MARK: - Dependency

extension UnsplashPhotoFeedListViewController {
    struct Dependency {
        let reactor: Reactor
    }
}
