//
//  ApplicationRouterType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

class ApplicationRouterType: BaseRootRouter, FactoryModule {

    required init(dependency: Dependency) { }

    func presentRoot() {
        abstractMethod()
    }
}

// MARK: - Dependency

extension ApplicationRouterType {
    struct Dependency {
        let rootTabBarRouter: RootTabBarRouterType
    }
}
