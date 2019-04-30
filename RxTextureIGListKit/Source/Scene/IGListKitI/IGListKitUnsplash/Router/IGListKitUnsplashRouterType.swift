//
//  IGListKitUnsplashRouterType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

class IGListKitUnsplashRouterType: BaseRootRouter, FactoryModule {

    required init(dependency: Dependency) { }

    func presentUnsplashPhotoFeedList() {
        abstractMethod()
    }
}

extension IGListKitUnsplashRouterType {
    struct Dependency {
        let navigationController: UINavigationController
        let igListKitUnsplashPhotoFeedListVCFactory: RxTextureIGListKit
        .Factory<IGListKitUnsplashPhotoFeedListViewController>
    }
}
