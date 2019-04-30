//
//  StubIGListKitUnsplashRouter.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Stubber

final class StubIGListKitUnsplashRouter: IGListKitUnsplashRouterType {

    override var rootViewController: UIViewController { return getRootViewController() }

    override func presentUnsplashPhotoFeedList() {
        Stubber.invoke(self.presentUnsplashPhotoFeedList, args: (), default: ())
    }
}

extension StubIGListKitUnsplashRouter {
    func getRootViewController() -> UIViewController {
        return Stubber.invoke(self.getRootViewController, args: (), default: UIViewController())
    }
}

// MARK: - Dependency

extension IGListKitUnsplashRouterType {
    static func stub(dependency: Dependency = .stub()) -> StubIGListKitUnsplashRouter {
        return .init(dependency: dependency)
    }
}

extension IGListKitUnsplashRouterType.Dependency {
    static func stub(
        navigationController: UINavigationController = UINavigationController(),
        igListKitUnsplashPhotoFeedListVCFactory: Factory<IGListKitUnsplashPhotoFeedListViewController> = .stub()
        ) -> IGListKitUnsplashRouterType.Dependency {
        return .init(
            navigationController: navigationController,
            igListKitUnsplashPhotoFeedListVCFactory: igListKitUnsplashPhotoFeedListVCFactory
        )
    }
}
