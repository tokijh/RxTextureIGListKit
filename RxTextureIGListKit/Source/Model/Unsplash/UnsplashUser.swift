//
//  UnsplashUser.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

struct UnsplashUser: Codable {
    let id: String
    let username: String
    let profileImage: UnsplashUserProfileImage

    private enum CodingKeys: String, CodingKey {
        case id
        case username
        case profileImage = "profile_image"
    }
}
