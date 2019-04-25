//
//  ApplicationRouter.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Pure
import UIKit

final class ApplicationRouter: ApplicationRouterType, FactoryModule {

    // MARK: - Property

    let navigationController: UINavigationController

    // MARK: - Lifecycle

    init(dependency: Dependency, payload: ()) {
        self.navigationController = dependency.navigationController
    }

    // MAKR: - ApplicationRouter

    func presentRoot() { }
}

// MARK: - Dependency

extension ApplicationRouter {
    struct Dependency {
        let navigationController: UINavigationController
    }
}
