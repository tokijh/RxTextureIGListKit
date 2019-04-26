//
//  UnsplashRouterSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick

final class UnsplashRouterSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        describe("when init") {
            var navigationController: UINavigationController!
            var unsplashPhotoFeedListVCFactory: StubFactory<UnsplashPhotoFeedListViewController>!

            beforeEach {
                navigationController = .init()
                unsplashPhotoFeedListVCFactory = .stub(UnsplashPhotoFeedListViewController())
            }

            let when = {
                _ = UnsplashRouter(
                    dependency: .stub(
                        navigationController: navigationController,
                        unsplashPhotoFeedListVCFactory: unsplashPhotoFeedListVCFactory
                    )
                )
            }

            it("navigationController.topViewController to equal unsplashPhotoFeedListVC") {
                let unsplashPhotoFeedListVC = UnsplashPhotoFeedListViewController()
                unsplashPhotoFeedListVCFactory.register(unsplashPhotoFeedListVC)

                when()

                expect(navigationController.topViewController).to(equal(unsplashPhotoFeedListVC))
            }
        }

        describe("Dependency") {
            var dependency: UnsplashRouter.Dependency!

            describe("when init") {
                let when = {
                    dependency = .init()
                }

                it("unsplashPhotoFeedListVCFactory is not StubFactory") {
                    when()

                    expect(dependency.unsplashPhotoFeedListVCFactory is StubFactory).to(beFalse())
                }
            }
        }
    }
}
