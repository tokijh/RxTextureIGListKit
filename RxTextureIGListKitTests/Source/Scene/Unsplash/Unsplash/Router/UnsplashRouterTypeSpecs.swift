//
//  UnsplashRouterTypeSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick

final class UnsplashRouterTypeSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var navigationController: UINavigationController!
        var unsplashListVCFactory: StubFactory<UnsplashListViewController>!
        var router: UnsplashRouterType!

        beforeEach {
            navigationController = .init()
            unsplashListVCFactory = .stub()

            router = UnsplashRouterType(
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

            it("should be fatalError") {
                expect(when()).to(throwAssertion())
            }
        }
    }
}
