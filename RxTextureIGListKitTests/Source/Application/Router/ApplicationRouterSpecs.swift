//
//  ApplicationRouterSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class ApplicationRouterSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var rootTabBarRouter: StubRootTabBarRouter!
        var router: ApplicationRouter!

        beforeEach {
            rootTabBarRouter = .stub()
            router = ApplicationRouter(dependency: .init(rootTabBarRouter: rootTabBarRouter))
        }

        it("rootViewController to equal rootTabBarRouter.rootViewController") {
            let rootViewController = UIViewController()
            Stubber.register(rootTabBarRouter.getRootViewController) { rootViewController }

            expect(router.rootViewController).to(equal(rootTabBarRouter.rootViewController))
        }

        describe("when presentRoot") {
            let when = {
                router.presentRoot()
            }

            it("rootTabBarRouter.presentUnsplash should be call one time") {
                when()

                expect(Stubber.executions(rootTabBarRouter.presentUnsplash).count).to(equal(1))
            }
        }
    }
}
