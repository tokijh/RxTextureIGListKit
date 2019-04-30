//
//  IGListKitUnsplashRouterSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick

final class IGListKitUnsplashRouterSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        describe("when init") {
            var navigationController: UINavigationController!
            var igListKitUnsplashPhotoFeedListVCFactory: StubFactory<IGListKitUnsplashPhotoFeedListViewController>!

            beforeEach {
                navigationController = .init()
                igListKitUnsplashPhotoFeedListVCFactory = .stub(
                    IGListKitUnsplashPhotoFeedListViewController(dependency: .stub())
                )
            }

            let when = {
                _ = IGListKitUnsplashRouter(
                    dependency: .stub(
                        navigationController: navigationController,
                        igListKitUnsplashPhotoFeedListVCFactory: igListKitUnsplashPhotoFeedListVCFactory
                    )
                )
            }

            it("navigationController.topViewController to equal igListKitUnsplashPhotoFeedListVC") {
                let igListKitUnsplashPhotoFeedListVC = IGListKitUnsplashPhotoFeedListViewController.stub()
                igListKitUnsplashPhotoFeedListVCFactory.register(igListKitUnsplashPhotoFeedListVC)

                when()

                expect(navigationController.topViewController).to(equal(igListKitUnsplashPhotoFeedListVC))
            }
        }

        describe("Dependency") {
            var dependency: IGListKitUnsplashRouter.Dependency!

            describe("when init") {
                let when = {
                    dependency = .init()
                }

                it("igListKitUnsplashPhotoFeedListVCFactory is not StubFactory") {
                    when()

                    expect(dependency.igListKitUnsplashPhotoFeedListVCFactory is StubFactory).to(beFalse())
                }
            }
        }
    }
}
