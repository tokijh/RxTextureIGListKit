//
//  StubUnsplashPhotoFeed.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension UnsplashPhotoFeed {
    static func stub(
        id: String = "",
        urls: UnsplashPhotoURL? = nil,
        description: String? = nil,
        uploadedDateString: String? = nil,
        likesCount: Int = 0,
        user: UnsplashUser? = nil
        ) -> UnsplashPhotoFeed {
        return .init(
            id: id,
            urls: urls,
            description: description,
            uploadedDateString: uploadedDateString,
            likesCount: likesCount,
            user: user
        )
    }
}
