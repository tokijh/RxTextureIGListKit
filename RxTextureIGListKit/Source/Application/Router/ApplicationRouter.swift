//
//  ApplicationRouter.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

final class ApplicationRouter: ApplicationRouterType {

    // MARK: - Property

    let navigationController: UINavigationController
    let rootTabBarRouter: RootTabBarRouterType

    // MARK: - Lifecycle

    required init(dependency: Dependency) {
        self.navigationController = dependency.navigationController
        self.rootTabBarRouter = dependency.rootTabBarRouter
        super.init(dependency: dependency)
    }

    // MAKR: - ApplicationRouter

    override var rootViewController: UIViewController { return navigationController }

    override func presentRoot() {
        rootTabBarRouter.presentUnsplash()
    }
}

// MARK: - Dependency

extension ApplicationRouter.Dependency {
    init() {
        self.navigationController = BaseNavigationController()
        self.rootTabBarRouter = .init(dependency: .init())
    }
}
