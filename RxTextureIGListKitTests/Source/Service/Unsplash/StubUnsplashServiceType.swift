//
//  StubUnsplashServiceType.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import RxSwift
import Stubber

final class StubUnsplashService: UnsplashServiceType {
    func fetchPopularPhotos(page: Int, perPage: Int) -> Single<[UnsplashPhotoFeed]> {
        return Stubber.invoke(self.fetchPopularPhotos, args: (page, perPage), default: Single.never())
    }
}

extension UnsplashServiceType {
    static func stub() -> StubUnsplashService {
        return .init()
    }
}
