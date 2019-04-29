//
//  UnsplashServiceType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import RxSwift

protocol UnsplashServiceType: Service {
    func fetchPopularPhotos(page: Int, perPage: Int) -> Single<[UnsplashPhotoFeed]>
}
