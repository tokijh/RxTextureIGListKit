//
//  StubApplicationRouter.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Pure
import Stubber

final class StubApplicationRouter: ApplicationRouterType, FactoryModule {

    // MARK: - Property

    let navigationController: UINavigationController

    // MARK: - Lifecycle

    init(dependency: Dependency = .stub(), payload: () = ()) {
        self.navigationController = dependency.navigationController
    }

    // MAKR: - ApplicationRouter

    func presentRoot() {
        Stubber.invoke(self.presentRoot, args: (), default: ())
    }
}

// MARK: - Dependency

extension StubApplicationRouter {
    typealias Dependency = ApplicationRouter.Dependency
}

extension ApplicationRouter {
    static func stub(dependency: Dependency = .stub()) -> StubApplicationRouter {
        return .init(dependency: dependency)
    }
}

extension ApplicationRouter.Dependency {
    static func stub(
        navigationController: UINavigationController = UINavigationController()
        ) -> ApplicationRouter.Dependency {
        return .init(navigationController: navigationController)
    }
}
