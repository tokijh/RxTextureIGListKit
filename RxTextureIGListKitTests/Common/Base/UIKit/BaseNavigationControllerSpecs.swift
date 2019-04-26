//
//  BaseNavigationControllerSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class BaseNavigationControllerSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var navigationController: StubBaseNavigationController!

        beforeEach {
            navigationController = .init()
        }

        describe("when viewDidLoad") {
            let when = {
                navigationController.viewDidLoad()
            }

            it("setupView should be call one time") {
                Stubber.register(navigationController.setupView) { }

                when()

                expect(Stubber.executions(navigationController.setupView).count).to(equal(1))
            }
        }
    }
}
