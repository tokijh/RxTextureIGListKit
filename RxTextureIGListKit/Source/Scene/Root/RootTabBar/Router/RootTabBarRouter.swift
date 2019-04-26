//
//  RootTabBarRouter.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

final class RootTabBarRouter: RootTabBarRouterType {

    // MARK: - Property

    let tabBarController: UITabBarController
    override var rootViewController: UIViewController { return tabBarController }

    let unsplashViewController: UIViewController

    // MARK: - Lifecycle

    required init(dependency: Dependency) {
        self.tabBarController = dependency.tabBarController
        self.unsplashViewController = dependency.unsplashViewController
        super.init(dependency: dependency)
        setupTabBarController()
    }

    override func presentUnsplash() {
        tabBarController.selectedViewController = unsplashViewController
    }
}

extension RootTabBarRouter {
    private func setupTabBarController() {
        tabBarController.viewControllers = [unsplashViewController]
    }
}

// MARK: - Dependency

extension RootTabBarRouter.Dependency {
    init() {
        self.tabBarController = RootTabBarController()
        self.unsplashViewController = UnsplashViewController()
    }
}
