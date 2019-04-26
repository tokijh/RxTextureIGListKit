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

final class RootTabBarRouterSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var unsplashViewController: UIViewController!
        var tabBarController: UITabBarController!
        var router: RootTabBarRouter!

        beforeEach {
            unsplashViewController = UIViewController()
            tabBarController = UITabBarController()

            router = RootTabBarRouter(
                dependency: .init(
                    tabBarController: tabBarController,
                    unsplashViewController: unsplashViewController
                )
            )
        }

        describe("when init") {
            let when = {
                router = RootTabBarRouter(
                    dependency: .init(
                        tabBarController: tabBarController,
                        unsplashViewController: unsplashViewController
                    )
                )
            }

            it("rootViewController to equal tabBarController") {
                when()

                expect(router.rootViewController).to(equal(tabBarController))
            }

            it("tabBarController.viewControllers to equal expected") {
                let expected = [unsplashViewController]

                when()

                expect(router.tabBarController.viewControllers).to(equal(expected))
            }
        }

        describe("when presentUnsplash") {
            let when = {
                router.presentUnsplash()
            }

            it("tabBarController.selectedViewControler to equal unsplashViewController") {
                when()

                expect(tabBarController.selectedViewController).to(equal(unsplashViewController))
            }
        }
    }
}
