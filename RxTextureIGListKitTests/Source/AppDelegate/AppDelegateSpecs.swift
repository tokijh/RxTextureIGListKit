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
                appDelegate = .init()
            }

            it("application is Application") {
                when()

                expect(appDelegate.application is Application).to(beTrue())
            }

            it("application.delegate to equal appDelegate") {
                when()

                expect(appDelegate.application.delegate as? AppDelegate).to(equal(appDelegate))
            }
        }

        describe("when init with dependency") {
            let when = {
                appDelegate = .init(dependency: .stub(application: application))
            }

            it("application.delegate to equal appDelegate") {
                when()

                expect(application.delegate as? AppDelegate).to(equal(appDelegate))
            }
        }

        describe("when didFinishLaunchingWithOption") {
            var _application: UIApplication!
            var options: [UIApplication.LaunchOptionsKey: Any]?

            beforeEach {
                _application = .shared
                options = nil
            }

            let when = {
                _ = appDelegate.application(_application, didFinishLaunchingWithOptions: options)
            }

            it("application.didFinishLaunchingWithOption should be call one time") {
                Stubber.register(application!.application) { _ in true }

                when()

                expect(Stubber.executions(application.application).count).to(equal(1))
            }
        }

        describe("Dependency") {
            var dependency: AppDelegate.Dependency!

            describe("when create") {
                let when = {
                    dependency = .create()
                }

                it("application is ApplicationRouter") {
                    when()

                    expect(dependency.application is Application).to(beTrue())
                }
            }
        }
    }
}
