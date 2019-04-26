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

        var unsplashRouter: StubUnsplashRouter!
        var tabBarController: UITabBarController!
        var router: RootTabBarRouterType!

        beforeEach {
            tabBarController = UITabBarController()
            unsplashRouter = .stub()

            router = RootTabBarRouterType(
                dependency: .init(
                    tabBarController: tabBarController,
                    unsplashRouter: unsplashRouter
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

        describe("when presentUnsplash") {
            let when = {
                router.presentUnsplash()
            }

            it("should be fatalError") {
                expect(when()).to(throwAssertion())
            }
        }
    }
}
