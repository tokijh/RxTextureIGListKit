//
//  RootTabBarRouterTypeSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick

final class RootTabBarRouterTypeSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var igListKitUnsplashRouter: StubIGListKitUnsplashRouter!
        var tabBarController: UITabBarController!
        var router: RootTabBarRouterType!

        beforeEach {
            tabBarController = UITabBarController()
            igListKitUnsplashRouter = .stub()

            router = RootTabBarRouterType(
                dependency: .init(
                    tabBarController: tabBarController,
                    igListKitUnsplashRouter: igListKitUnsplashRouter
                )
            )
        }

        describe("when get rootViewController") {
            let when = {
                _ = router.rootViewController
            }

            it("should be fatalError") {
                expect(when()).to(throwAssertion())
            }
        }

        describe("when presentIGListKitUnsplash") {
            let when = {
                router.presentIGListKitUnsplash()
            }

            it("should be fatalError") {
                expect(when()).to(throwAssertion())
            }
        }
    }
}
