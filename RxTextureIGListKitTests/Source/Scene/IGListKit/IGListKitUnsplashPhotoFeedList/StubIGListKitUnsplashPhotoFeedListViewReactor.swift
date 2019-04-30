//
//  StubIGListKitUnsplashPhotoFeedListViewReactor.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension IGListKitUnsplashPhotoFeedListViewReactor {
    static func stub(
        dependency: IGListKitUnsplashPhotoFeedListViewReactor.Dependency = .stub()
        ) -> IGListKitUnsplashPhotoFeedListViewReactor {
        return .init(dependency: dependency)
    }
}

extension IGListKitUnsplashPhotoFeedListViewReactor.Dependency {
    static func stub(
        service: UnsplashServiceType = StubUnsplashService()
        ) -> IGListKitUnsplashPhotoFeedListViewReactor.Dependency {

        return .init(service: service)
    }
}
