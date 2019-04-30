//
//  RootTabBarRouterSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class RootTabBarRouterSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var tabBarController: UITabBarController!
        var igListKitUnsplashRouter: StubIGListKitUnsplashRouter!
        var router: RootTabBarRouter!

        let initRouter = {
            router = RootTabBarRouter(
                dependency: .init(
                    tabBarController: tabBarController,
                    igListKitUnsplashRouter: igListKitUnsplashRouter
                )
            )
        }

        beforeEach {
            tabBarController = UITabBarController()
            igListKitUnsplashRouter = .stub()

            initRouter()
        }

        describe("when init") {
            let when = initRouter

            it("rootViewController to equal tabBarController") {
                when()

                expect(router.rootViewController).to(equal(tabBarController))
            }

            it("tabBarController.viewControllers to equal expected") {
                let igListKitUnsplashRootViewController = UINavigationController()
                Stubber.register(igListKitUnsplashRouter.getRootViewController) { igListKitUnsplashRootViewController }
                let expected = [igListKitUnsplashRootViewController]

                when()

                expect(router.tabBarController.viewControllers).to(equal(expected))
            }
        }

        describe("when presentIGListKitUnsplash") {
            let when = {
                router.presentIGListKitUnsplash()
            }

            it("tabBarController.selectedViewControler to equal igListKitUnsplashRouter.rootViewController") {
                when()

                expect(tabBarController.selectedViewController).to(equal(igListKitUnsplashRouter.rootViewController))
            }
        }

        describe("Dependency") {
            var dependency: RootTabBarRouter.Dependency!

            describe("when init") {
                let when = {
                    dependency = .init()
                }

                it("tabBarController is RootTabBarController") {
                    when()

                    expect(dependency.tabBarController is RootTabBarController).to(beTrue())
                }

                it("igListKitUnsplashRouter is IGListKitUnsplashRouter") {
                    when()

                    expect(dependency.igListKitUnsplashRouter is IGListKitUnsplashRouter).to(beTrue())
                }
            }
        }
    }
}
