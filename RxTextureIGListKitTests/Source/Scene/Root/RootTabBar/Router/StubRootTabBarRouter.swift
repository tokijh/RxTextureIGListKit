//
//  StubRootTabBarRouter.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Stubber

final class StubRootTabBarRouter: RootTabBarRouterType {

    override var rootViewController: UIViewController { return getRootViewController() }

    override func presentUnsplash() {
        Stubber.invoke(self.presentUnsplash, args: (), default: ())
    }
}

extension StubRootTabBarRouter {
    func getRootViewController() -> UIViewController {
        return Stubber.invoke(self.getRootViewController, args: (), default: UIViewController())
    }
}

// MARK: - Dependency

extension RootTabBarRouterType {
    static func stub(dependency: Dependency = .stub()) -> StubRootTabBarRouter {
        return .init(dependency: dependency)
    }
}

extension RootTabBarRouterType.Dependency {
    static func stub(
        tabBarController: UITabBarController = UITabBarController(),
        unsplashRouter: UnsplashRouterType = .stub()
        ) -> RootTabBarRouterType.Dependency {
        return .init(tabBarController: tabBarController, unsplashRouter: unsplashRouter)
    }
}
