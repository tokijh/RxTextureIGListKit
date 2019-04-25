//
//  AppDelegateSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class AppDelegateSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var application: StubApplication!
        var appDelegate: AppDelegate!

        beforeEach {
            application = StubApplication()
            appDelegate = .init(dependency: .stub(application: application))
        }

        describe("when init") {
            let when = {
                appDelegate = .init(dependency: .stub(application: application))
            }

            it("application.delegate to equal appDelegate") {
                when()

                expect(application.delegate as? AppDelegate).to(equal(appDelegate))
            }
        }
    }
}
