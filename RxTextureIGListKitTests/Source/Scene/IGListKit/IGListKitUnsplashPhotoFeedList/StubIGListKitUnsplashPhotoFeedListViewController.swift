//
//  StubIGListKitUnsplashPhotoFeedListViewController.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension IGListKitUnsplashPhotoFeedListViewController {
    static func stub(dependency: Dependency = .stub()) -> IGListKitUnsplashPhotoFeedListViewController {
        return .init(dependency: dependency)
    }
}

extension IGListKitUnsplashPhotoFeedListViewController.Dependency {
    static func stub(
        reactor: IGListKitUnsplashPhotoFeedListViewReactor = .stub()
        ) -> IGListKitUnsplashPhotoFeedListViewController.Dependency {
        return .init(reactor: reactor)
    }
}
