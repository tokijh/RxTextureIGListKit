//
//  UnsplashPhotoFeedListViewReactor.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import ReactorKit
import RxSwift

final class UnsplashPhotoFeedListViewReactor: Reactor, FactoryModule {

    // MARK: - Typealias

    enum Action {

    }
    enum Mutation {

    }
    struct State {

    }

    // MARK: - Property

    let service: UnsplashServiceType
    let initialState: State

    // MARK: - Lifecycle

    init(dependency: Dependency) {
        self.service = dependency.service
        self.initialState = State()
    }
}

// MARK: - Dependency

extension UnsplashPhotoFeedListViewReactor {
    struct Dependency {
        let service: UnsplashServiceType
    }
}
