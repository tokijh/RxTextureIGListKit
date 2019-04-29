//
//  StubUnsplashUser.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

extension UnsplashUser {
    static func stub(
        id: String = "",
        userName: String = "",
        profileImage: UnsplashUserProfileImage = .stub()
        ) -> UnsplashUser {
        return .init(
            id: id,
            userName: userName,
            profileImage: profileImage
        )
    }
}
