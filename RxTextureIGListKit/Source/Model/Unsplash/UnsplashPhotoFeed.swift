//
//  UnsplashPhotoFeed.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

struct UnsplashPhotoFeed: Codable {
    let id: String
    let urls: UnsplashPhotoURL
    let description: String
    let uploadedDateString: String
    let likesCount: Int
    let user: UnsplashUser

    enum CodingKeys: String, CodingKey {
        case id
        case urls
        case description
        case uploadedDateString = "created_at"
        case likesCount = "likes"
        case user = "user"
    }
}
