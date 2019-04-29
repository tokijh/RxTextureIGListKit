//
//  StubUnsplashPhotoFeedListViewReactor.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension UnsplashPhotoFeedListViewReactor {
    static func stub(
        dependency: UnsplashPhotoFeedListViewReactor.Dependency = .stub()
        ) -> UnsplashPhotoFeedListViewReactor {
        return .init(dependency: dependency)
    }
}

extension UnsplashPhotoFeedListViewReactor.Dependency {
    static func stub(
        service: UnsplashServiceType = StubUnsplashService()
        ) -> UnsplashPhotoFeedListViewReactor.Dependency {

        return .init(service: service)
    }
}
