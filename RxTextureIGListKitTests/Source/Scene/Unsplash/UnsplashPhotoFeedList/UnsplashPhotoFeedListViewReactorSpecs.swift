//
//  UnsplashPhotoFeedListViewReactorSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

import RxSwift

final class c: QuickSpec {

    // MARK: - Typealias

    typealias Reactor = UnsplashPhotoFeedListViewReactor

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var service: StubUnsplashService!
        var reactor: Reactor!
        var initialState: Reactor.State! {
            didSet {
                reactor = Reactor(dependency: .stub(service: service), initialState: initialState)
            }
        }

        beforeEach {
            service = .stub()
            initialState = .init()
        }

        describe("when action.initialize") {
            let when = {
                reactor.action.onNext(.initialize)
            }

            it("service.fetchPopularPhotos should be call") {
                Stubber.register(service!.fetchPopularPhotos) { _ in
                    Single.never()
                }

                when()

                expect(Stubber.executions(service!.fetchPopularPhotos).count).to(equal(1))
            }

            context("fetchPopularPhotos recived success") {
                let receivedPhotoFeeds = [
                    UnsplashPhotoFeed.stub(id: "1"),
                    UnsplashPhotoFeed.stub(id: "2"),
                    UnsplashPhotoFeed.stub(id: "3")
                ]

                beforeEach {
                    Stubber.register(service!.fetchPopularPhotos) { _ in
                        Single.just(receivedPhotoFeeds)
                    }
                }

                it("state.photoFeeds to equal received") {
                    when()

                    expect(reactor.currentState.photoFeeds.map({ $0.id }))
                        .to(equal(receivedPhotoFeeds.map({ $0.id })))
                }
            }
        }

        describe("state.sectionItems") {
            context("photoFeeds set") {
                let photoFeeds = [
                    UnsplashPhotoFeed.stub(id: "1"),
                    UnsplashPhotoFeed.stub(id: "2"),
                    UnsplashPhotoFeed.stub(id: "3")
                ]

                beforeEach {
                    initialState.photoFeeds = photoFeeds
                }
            }
            it("sectionItems to equal expected") {
                let expected: [UnsplashPhotoFeedListItem] = [
                    .photoFeed(UnsplashPhotoFeed.stub(id: "1")),
                    .photoFeed(UnsplashPhotoFeed.stub(id: "2")),
                    .photoFeed(UnsplashPhotoFeed.stub(id: "3"))
                ]
                expect(reactor.currentState.sectionItems).to(match) { items in
                    zip(items, expected)
                        .map({
                            switch $0 {
                            case let (.photoFeed(lPhotoFeed), .photoFeed(RPhotoFeed)):
                                return lPhotoFeed.id == RPhotoFeed.id
                            }
                        })
                        .filter({ $0 })
                        .isEmpty
                }
            }
        }
    }
}
