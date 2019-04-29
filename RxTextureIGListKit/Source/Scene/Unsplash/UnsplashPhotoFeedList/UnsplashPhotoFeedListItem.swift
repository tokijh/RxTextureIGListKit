//
//  UnsplashPhotoFeedListItem.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import Foundation

enum UnsplashPhotoFeedListItem {
    case photoFeed(UnsplashPhotoFeed)
}

extension UnsplashPhotoFeedListItem: Diffable {
    func diffIdentifier() -> NSObjectProtocol {
        switch self {
        case let .photoFeed(photoFeed):
            return photoFeed.id as NSObjectProtocol
        }
    }

    func isEqual(to object: UnsplashPhotoFeedListItem) -> Bool {
        switch (self, object) {
        case let (.photoFeed(rPhotoFeed), .photoFeed(lPhotoFeed)):
            return rPhotoFeed.id == lPhotoFeed.id
        }
    }
}
