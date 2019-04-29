//
//  StubUnsplashPhotoURL.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension UnsplashPhotoURL {
    static func stub(
        full: String = "",
        raw: String = "",
        regular: String = "",
        small: String = "",
        thumb: String = ""
        ) -> UnsplashPhotoURL {
        return .init(
            full: full,
            raw: raw,
            regular: regular,
            small: small,
            thumb: thumb
        )
    }
}
