//
//  UnsplashPhotoFeedListViewReactor.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import ReactorKit
import RxSwift

import IGListKit

final class UnsplashPhotoFeedListViewReactor: Reactor, FactoryModule {

    // MARK: - Typealias

    enum Action {
        case initialize
    }

    enum Mutation {
        case setPhotoFeeds([UnsplashPhotoFeed])
    }

    struct State {
        var photoFeeds: [UnsplashPhotoFeed] = []
        var sectionItems: [UnsplashPhotoFeedListItem] {
            return photoFeeds.map({ .photoFeed($0) })
        }
    }

    // MARK: - Property

    let service: UnsplashServiceType
    let initialState: State

    // MARK: - Lifecycle

    convenience init(dependency: Dependency) {
        self.init(dependency: dependency, initialState: State())
    }

    init(dependency: Dependency, initialState: State) {
        self.service = dependency.service
        self.initialState = initialState
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .initialize:
            // Muataion
            let setPhotoFeeds: Observable<Mutation>

            setPhotoFeeds = service.fetchPopularPhotos(page: 0, perPage: 10)
                .asObservable()
                .map({ .setPhotoFeeds($0) })

            return setPhotoFeeds
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        case let .setPhotoFeeds(photoFeeds):
            state.photoFeeds = photoFeeds
        }

        return state
    }
}

// MARK: - Dependency

extension UnsplashPhotoFeedListViewReactor {
    struct Dependency {
        let service: UnsplashServiceType
    }
}
