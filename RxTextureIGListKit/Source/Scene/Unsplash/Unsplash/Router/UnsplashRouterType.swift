//
//  UnsplashRouterType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

class UnsplashRouterType: Router, FactoryModule {

    required init(dependency: Dependency) { }

    func presentUnsplashList() {
        abstractMethod()
    }
}

extension UnsplashRouterType {
    struct Dependency {
        let navigationController: UINavigationController
        let unsplashListVCFactory: Factory<UnsplashListViewController>
    }
}
