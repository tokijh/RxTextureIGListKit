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

    unowned let navigationController: UINavigationController
    let unsplashListVCFactory: Factory<UnsplashListViewController>

    // MARK: - Lifecycle

    required init(dependency: Dependency) {
        self.navigationController = dependency.navigationController
        self.unsplashListVCFactory = dependency.unsplashListVCFactory
        super.init(dependency: dependency)
    }

    override func presentUnsplashList() {
        let vc = unsplashListVCFactory.create()
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - Dependency

extension UnsplashRouter.Dependency {
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.unsplashListVCFactory = Factory<UnsplashListViewController>()
    }
}
