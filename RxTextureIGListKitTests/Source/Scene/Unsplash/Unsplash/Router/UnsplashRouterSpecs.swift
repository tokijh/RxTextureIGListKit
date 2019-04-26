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

        var navigationController: UINavigationController!
        var unsplashListVCFactory: StubFactory<UnsplashListViewController>!
        var router: UnsplashRouter!

        beforeEach {
            navigationController = .init()
            unsplashListVCFactory = .stub()

            router = UnsplashRouter(
                dependency: .init(
                    navigationController: navigationController,
                    unsplashListVCFactory: unsplashListVCFactory
                )
            )
        }

        describe("when presentUnsplashList") {
            let when = {
                router.presentUnsplashList()
            }

            it("navigationController.topViewController to equal unsplashListVC") {
                let unsplashListVC = UnsplashListViewController()
                unsplashListVCFactory.register(unsplashListVC)

                when()

                expect(navigationController.topViewController).to(equal(unsplashListVC))
            }
        }
    }
}
