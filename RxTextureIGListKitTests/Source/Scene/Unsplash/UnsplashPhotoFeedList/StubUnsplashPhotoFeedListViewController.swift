//
//  StubUnsplashPhotoFeedListViewController.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension UnsplashPhotoFeedListViewController {
    static func stub(dependency: Dependency = .stub()) -> UnsplashPhotoFeedListViewController {
        return .init(dependency: dependency)
    }
}

extension UnsplashPhotoFeedListViewController.Dependency {
    static func stub(
        reactor: UnsplashPhotoFeedListViewReactor = .stub()
        ) -> UnsplashPhotoFeedListViewController.Dependency {
        return .init(reactor: reactor)
    }
}
