//
//  UnsplashPhotoFeedSectionReactor.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import ReactorKit

final class UnsplashPhotoFeedSectionReactor: Reactor, FactoryModule {

    // MARK: - Typealias

    typealias Action = NoAction

    struct State {

    }

    // MARK: - Property

    let unsplashPhotoFeed: UnsplashPhotoFeed
    let initialState: State

    // MARK: - Lifecycle

    init(dependency: Dependency) {
        self.unsplashPhotoFeed = dependency.unsplashPhotoFeed
        self.initialState = State()
    }
}

// MARK: - Dependency

extension UnsplashPhotoFeedSectionReactor {
    struct Dependency {
        let unsplashPhotoFeed: UnsplashPhotoFeed
    }
}
