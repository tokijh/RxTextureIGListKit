//
//  UnsplashRouterTypeSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick

final class UnsplashRouterTypeSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var navigationController: UINavigationController!
        var unsplashPhotoFeedListVCFactory: StubFactory<UnsplashPhotoFeedListViewController>!
        var router: UnsplashRouterType!

        beforeEach {
            navigationController = .init()
            unsplashPhotoFeedListVCFactory = .stub()

            router = UnsplashRouterType(
                dependency: .init(
                    navigationController: navigationController,
                    unsplashPhotoFeedListVCFactory: unsplashPhotoFeedListVCFactory
                )
            )
        }

        describe("when presentUnsplashPhotoFeedList") {
            let when = {
                router.presentUnsplashPhotoFeedList()
            }

            it("should be fatalError") {
                expect(when()).to(throwAssertion())
            }
        }
    }
}
