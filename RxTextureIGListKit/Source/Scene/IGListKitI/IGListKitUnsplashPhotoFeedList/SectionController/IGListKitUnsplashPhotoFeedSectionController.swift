//
//  UnsplashPhotoFeedSectionController.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import AsyncDisplayKit
import IGListKit
import ReactorKit
import RxSwift

final class IGListKitUnsplashPhotoFeedSectionController: ListBindingSectionController<ListDiffable>,
    ASSectionController, Reactor, FactoryModule {

    // MARK: - Typealias

    enum Action {
        case didUpdatePhotoFeed(UnsplashPhotoFeed)
    }

    enum Mutation {
        case setPhotoFeed(UnsplashPhotoFeed)
    }

    struct State {
        var photoFeed: UnsplashPhotoFeed = .empty()
    }

    // MARK: - Property

    var disposeBag = DisposeBag()
    let initialState: State

    // MARK: - Lifecycle

    init(dependency: Dependency) {
        defer { _ = self.state }
        self.initialState = State()
        super.init()
    }

    // MARK: - Texture

    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        return { [weak self] in
            guard let photoFeed = self?.currentState.photoFeed
                else {
                    return ASCellNode()
            }

            return UnsplashPhotoFeedCellNode(photoFeed: photoFeed)
        }
    }

    func transform(action: Observable<Action>) -> Observable<Action> {
        self.rx.methodInvoked(#selector(didUpdate(to:)))
            .subscribe()
            .disposed(by: disposeBag)
        let didUpdatePhotoFeed: Observable<Action> = rx.didUpdateWithDiffable(UnsplashPhotoFeedListItem.self)
            .map({ item -> Action? in
                switch item {
                case let .photoFeed(photoFeed):
                    return .didUpdatePhotoFeed(photoFeed)
                }
            })
            .filterNil()

        return .merge(action, didUpdatePhotoFeed)
    }

    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .didUpdatePhotoFeed(photoFeed):
            // Mutation
            let setPhotoFeed: Observable<Mutation>
            let update: Observable<Mutation>

            setPhotoFeed = .just(.setPhotoFeed(photoFeed))

            update = Observable.just(())
                .do(onNext: { [weak self] in
                    self?.update(animated: true)
                })
                .flatMap({ Observable.empty() })

            return .concat(setPhotoFeed, update)
        }
    }

    func reduce(state: State, mutation: Mutation) -> State {
        var state = state

        switch mutation {
        case let .setPhotoFeed(photoFeed):
            state.photoFeed = photoFeed
        }

        return state
    }

    // MARK: - IGListKit

    override func numberOfItems() -> Int {
        return 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
}
