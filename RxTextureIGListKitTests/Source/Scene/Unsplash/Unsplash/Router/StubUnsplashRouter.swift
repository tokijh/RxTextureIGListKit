//
//  StubUnsplashRouter.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Stubber

final class StubUnsplashRouter: UnsplashRouterType {

    override var rootViewController: UIViewController { return getRootViewController() }

    override func presentUnsplashPhotoFeedList() {
        Stubber.invoke(self.presentUnsplashPhotoFeedList, args: (), default: ())
    }
}

extension StubUnsplashRouter {
    func getRootViewController() -> UIViewController {
        return Stubber.invoke(self.getRootViewController, args: (), default: UIViewController())
    }
}

// MARK: - Dependency

extension UnsplashRouterType {
    static func stub(dependency: Dependency = .stub()) -> StubUnsplashRouter {
        return .init(dependency: dependency)
    }
}

extension UnsplashRouterType.Dependency {
    static func stub(
        navigationController: UINavigationController = UINavigationController(),
        unsplashPhotoFeedListVCFactory: Factory<UnsplashPhotoFeedListViewController> = .stub()
        ) -> UnsplashRouterType.Dependency {
        return .init(
            navigationController: navigationController,
            unsplashPhotoFeedListVCFactory: unsplashPhotoFeedListVCFactory
        )
    }
}
