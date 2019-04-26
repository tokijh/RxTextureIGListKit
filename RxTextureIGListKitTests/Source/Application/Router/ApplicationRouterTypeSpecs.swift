//
//  ApplicationRouterTypeSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class ApplicationRouterTypeSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var rootTabBarRouter: StubRootTabBarRouter!
        var router: ApplicationRouterType!

        beforeEach {
            rootTabBarRouter = .stub()
            router = ApplicationRouterType(dependency: .init(rootTabBarRouter: rootTabBarRouter))
        }

        describe("when get rootViewController") {
            let when = {
                _ = router.rootViewController
            }

            it("should be fatalError") {
                expect(when()).to(throwAssertion())
            }
        }

        describe("when presentRoot") {
            let when = {
                router.presentRoot()
            }

            it("should be fatalError") {
                expect(when()).to(throwAssertion())
            }
        }
    }
}
