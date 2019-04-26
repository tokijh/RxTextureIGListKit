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
        var unsplashRouter: StubUnsplashRouter!
        var router: RootTabBarRouter!

        let initRouter = {
            router = RootTabBarRouter(
                dependency: .init(
                    tabBarController: tabBarController,
                    unsplashRouter: unsplashRouter
                )
            )
        }

        beforeEach {
            tabBarController = UITabBarController()
            unsplashRouter = .stub()

            initRouter()
        }

        describe("when init") {
            let when = initRouter

            it("rootViewController to equal tabBarController") {
                when()

                expect(router.rootViewController).to(equal(tabBarController))
            }

            it("tabBarController.viewControllers to equal expected") {
                let unsplashRootViewController = UINavigationController()
                Stubber.register(unsplashRouter.getRootViewController) { unsplashRootViewController }
                let expected = [unsplashRootViewController]

                when()

                expect(router.tabBarController.viewControllers).to(equal(expected))
            }
        }

        describe("when presentUnsplash") {
            let when = {
                router.presentUnsplash()
            }

            it("tabBarController.selectedViewControler to equal unsplashRouter.rootViewController") {
                when()

                expect(tabBarController.selectedViewController).to(equal(unsplashRouter.rootViewController))
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

                it("unsplashViewController is UnsplashRouter") {
                    when()

                    expect(dependency.unsplashRouter is UnsplashRouter).to(beTrue())
                }
            }
        }
    }
}
