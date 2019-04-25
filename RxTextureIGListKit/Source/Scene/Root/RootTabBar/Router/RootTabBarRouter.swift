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

    unowned let tabBarController: UITabBarController
    override var rootViewController: UIViewController { return tabBarController }

    // MARK: - Lifecycle

    required init(dependency: Dependency, payload: Payload) {
        self.tabBarController = dependency.tabBarController
        super.init(dependency: dependency, payload: payload)
    }

    override func presentUnsplash() {

    }
}

// MARK: - Dependency

extension RootTabBarRouter.Dependency {
    init() {
        self.tabBarController = RootTabBarController()
    }
}
