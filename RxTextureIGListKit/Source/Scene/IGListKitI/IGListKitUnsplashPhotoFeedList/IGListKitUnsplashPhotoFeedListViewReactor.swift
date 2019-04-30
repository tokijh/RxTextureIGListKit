//
//  IGKistKitUnsplashPhotoFeedListViewReactor.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import ReactorKit
import RxSwift

import IGListKit

final class IGListKitUnsplashPhotoFeedListViewReactor: Reactor, FactoryModule {

    // MARK: - Typealias

    enum Action {
        case initialize
        case loadMore
    }

    enum Mutation {
        case setPhotoFeeds([UnsplashPhotoFeed])
        case addPhotoFeeds([UnsplashPhotoFeed])
        case setNextPage
    }

    struct State {
        var photoFeeds: [UnsplashPhotoFeed] = []
        var sectionItems: [UnsplashPhotoFeedListItem] {
            return photoFeeds.map({ .photoFeed($0) })
        }
        var currentPage: Int = 1
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
            let currentPage = currentState.currentPage

            // Muataion
            let setPhotoFeeds: Observable<Mutation>

            setPhotoFeeds = service.fetchPopularPhotos(page: currentPage, perPage: 100)
                .asObservable()
                .map({ .setPhotoFeeds($0) })

            return setPhotoFeeds

        case .loadMore:
            let currentPage = currentState.currentPage

            // Muataion
            let addPhotoFeeds: Observable<Mutation>
            let setNextPage: Observable<Mutation>

            setNextPage = .just(.setNextPage)

            addPhotoFeeds = service.fetchPopularPhotos(page: currentPage, perPage: 100)
                .asObservable()
                .map({ .addPhotoFeeds($0) })
                .catchErrorJustComplete()
                .concat(setNextPage)

            return addPhotoFeeds
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        case let .setPhotoFeeds(photoFeeds):
            state.photoFeeds = photoFeeds

        case let .addPhotoFeeds(photoFeeds):
            state.photoFeeds += photoFeeds

        case .setNextPage:
            state.currentPage += 1
        }

        return state
    }
}

// MARK: - Dependency

extension IGListKitUnsplashPhotoFeedListViewReactor {
    struct Dependency {
        let service: UnsplashServiceType
    }
}
