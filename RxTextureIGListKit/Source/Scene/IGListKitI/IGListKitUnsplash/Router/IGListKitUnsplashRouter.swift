//
//  IGListKitUnsplashRouter.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

final class IGListKitUnsplashRouter: IGListKitUnsplashRouterType {

    // MARK: - Property

    let navigationController: UINavigationController
    let igListKitUnsplashPhotoFeedListVCFactory: RxTextureIGListKit
    .Factory<IGListKitUnsplashPhotoFeedListViewController>

    // MARK: - Lifecycle

    required init(dependency: Dependency) {
        self.navigationController = dependency.navigationController
        self.igListKitUnsplashPhotoFeedListVCFactory = dependency.igListKitUnsplashPhotoFeedListVCFactory
        super.init(dependency: dependency)
        presentUnsplashPhotoFeedList()
    }

    override var rootViewController: UIViewController { return navigationController }

    override func presentUnsplashPhotoFeedList() {
        let vc = igListKitUnsplashPhotoFeedListVCFactory.create()
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - Dependency

extension IGListKitUnsplashRouter.Dependency {
    init() {
        self.navigationController = IGListKitUnsplashViewController()
        let igListKitUnsplashPhotoFeedListViewReactor = IGListKitUnsplashPhotoFeedListViewReactor(
            dependency: .init(service: UnsplashService())
        )
        self.igListKitUnsplashPhotoFeedListVCFactory = RxTextureIGListKit
            .Factory<IGListKitUnsplashPhotoFeedListViewController>(
            dependency: .init(reactor: igListKitUnsplashPhotoFeedListViewReactor)
        )
    }
}
