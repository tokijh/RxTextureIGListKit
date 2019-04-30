//
//  IGListKitUnsplashRouterTypeSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick

final class IGListKitUnsplashRouterTypeSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var navigationController: UINavigationController!
        var igListKitUnsplashPhotoFeedListVCFactory: StubFactory<IGListKitUnsplashPhotoFeedListViewController>!
        var router: IGListKitUnsplashRouterType!

        beforeEach {
            navigationController = .init()
            igListKitUnsplashPhotoFeedListVCFactory = .stub()

            router = IGListKitUnsplashRouterType(
                dependency: .init(
                    navigationController: navigationController,
                    igListKitUnsplashPhotoFeedListVCFactory: igListKitUnsplashPhotoFeedListVCFactory
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
