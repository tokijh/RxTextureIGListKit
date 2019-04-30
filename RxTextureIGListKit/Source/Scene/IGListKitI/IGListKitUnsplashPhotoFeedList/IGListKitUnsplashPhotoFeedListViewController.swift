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

final class IGListKitUnsplashPhotoFeedListViewController: ASViewController<ASCollectionNode>, View, FactoryModule {

    // MARK: - Typeaslias

    typealias Reactor = IGListKitUnsplashPhotoFeedListViewReactor
    typealias DataSource = BaseRxListAdapterDataSource<UnsplashPhotoFeedListItem>

    // MARK: - Property

    var disposeBag = DisposeBag()
    private let dataSource: DataSource

    private lazy var listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)

    // MARK: - Lifecycle

    convenience init(dependency: Dependency) {
        let node = ASCollectionNode(collectionViewLayout: UICollectionViewFlowLayout())
        self.init(node: node, dependency: dependency)
    }

    init(node: ASCollectionNode, dependency: Dependency) {
        defer { self.reactor = dependency.reactor }
        self.dataSource = .init(
            igListKitUnsplashPhotoFeedSectionControllerFactory: dependency
                .igListKitUnsplashPhotoFeedSectionControllerFactory
        )
        super.init(node: node)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        node.backgroundColor = .white
        node.automaticallyManagesSubnodes = true
        node.automaticallyRelayoutOnSafeAreaChanges = true

        listAdapter.setASDKCollectionNode(node)
    }

    // MARK: - Reactor

    func bind(reactor: Reactor) {
        // State
        reactor.state.map({ $0.sectionItems })
            .bind(to: listAdapter.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

        // Action
        rx.viewDidLoad.map({ Reactor.Action.initialize })
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

// MARK: - DataSource

extension IGListKitUnsplashPhotoFeedListViewController.DataSource {
    convenience init(
        igListKitUnsplashPhotoFeedSectionControllerFactory: RxTextureIGListKit
        .Factory<IGListKitUnsplashPhotoFeedSectionController>
        ) {
        self.init(configureSectionController: ({ (dataSource, listAdapter, item) -> ListSectionController in
                switch item {
                case .photoFeed:
                    return igListKitUnsplashPhotoFeedSectionControllerFactory.create()
                }
            })
        )
    }
}

// MARK: - Dependency

extension IGListKitUnsplashPhotoFeedListViewController {
    struct Dependency {
        let reactor: Reactor
        let igListKitUnsplashPhotoFeedSectionControllerFactory: RxTextureIGListKit
            .Factory<IGListKitUnsplashPhotoFeedSectionController> = .init()
    }
}
