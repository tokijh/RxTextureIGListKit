//
//  SwiftSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class SwiftSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {
        describe("fatalErrorInDebug") {

            context("message is default") {

                it("should be fatalError") {
                    expect({ _ = fatalErrorInDebug() }()).to(throwAssertion())
                }
            }

            context("message is inputed") {
                it("should be fatalError") {
                    expect({ _ = fatalErrorInDebug(message: "Some") }()).to(throwAssertion())
                }
            }
        }

        describe("abstractMethod") {

            it("should be fatalError") {
                expect({ _ = abstractMethod() }()).to(throwAssertion())
            }
        }
    }
}
