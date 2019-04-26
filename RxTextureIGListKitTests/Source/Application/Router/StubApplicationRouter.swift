//
//  StubApplicationRouter.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Stubber

final class StubApplicationRouter: ApplicationRouterType {

    // MARK: - Lifecycle

    required init(dependency: Dependency = .stub()) {
        super.init(dependency: dependency)
    }

    // MAKR: - ApplicationRouter

    override var rootViewController: UIViewController { return getRootViewController() }

    override func presentRoot() {
        Stubber.invoke(self.presentRoot, args: (), default: ())
    }
}

extension StubApplicationRouter {
    func getRootViewController() -> UIViewController {
        return Stubber.invoke(self.getRootViewController, args: (), default: UIViewController())
    }
}

// MARK: - Dependency

extension ApplicationRouterType {
    static func stub(dependency: Dependency = .stub()) -> StubApplicationRouter {
        return .init(dependency: dependency)
    }
}

extension ApplicationRouterType.Dependency {
    static func stub(
        navigationController: UINavigationController = UINavigationController(),
        rootTabBarRouter: RootTabBarRouterType = .stub()
        ) -> ApplicationRouterType.Dependency {
        return .init(navigationController: navigationController, rootTabBarRouter: rootTabBarRouter)
    }
}
