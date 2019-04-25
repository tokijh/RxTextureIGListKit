//
//  RootTabBarRouterType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Pure
import UIKit

class RootTabBarRouterType: BaseRootRouter, FactoryModule {

    required init(dependency: Dependency, payload: Payload) { }

    func presentUnsplash() {
        abstractMethod()
    }
}

extension RootTabBarRouterType {
    struct Dependency {
        let tabBarController: UITabBarController
    }
}
