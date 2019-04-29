//
//  StubUnsplashUserProfileImage.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension UnsplashUserProfileImage {
    static func stub(
        small: String = "",
        medium: String = "",
        large: String = ""
        ) -> UnsplashUserProfileImage {
        return .init(
            small: small,
            medium: medium,
            large: large
        )
    }
}
