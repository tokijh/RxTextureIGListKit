//
//  UnsplashRouter.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

final class UnsplashRouter: UnsplashRouterType {

    // MARK: - Property

    let navigationController: UINavigationController
    let unsplashPhotoFeedListVCFactory: RxTextureIGListKit.Factory<UnsplashPhotoFeedListViewController>

    // MARK: - Lifecycle

    required init(dependency: Dependency) {
        self.navigationController = dependency.navigationController
        self.unsplashPhotoFeedListVCFactory = dependency.unsplashPhotoFeedListVCFactory
        super.init(dependency: dependency)
        presentUnsplashPhotoFeedList()
    }

    override var rootViewController: UIViewController { return navigationController }

    override func presentUnsplashPhotoFeedList() {
        let vc = unsplashPhotoFeedListVCFactory.create()
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - Dependency

extension UnsplashRouter.Dependency {
    init() {
        self.navigationController = UnsplashViewController()
        let unsplashPhotoFeedListViewReactor = UnsplashPhotoFeedListViewReactor(
            dependency: .init(service: UnsplashService())
        )
        self.unsplashPhotoFeedListVCFactory = RxTextureIGListKit.Factory<UnsplashPhotoFeedListViewController>(
            dependency: .init(reactor: unsplashPhotoFeedListViewReactor)
        )
    }
}
