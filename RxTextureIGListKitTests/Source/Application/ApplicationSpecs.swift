//
//  ApplicationSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class ApplicationSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var router: StubApplicationRouter!
        var application: Application!

        beforeEach {
            router = .stub()
            application = .init(dependency: .init(router: router))
        }

        describe("when didFinishLaunchingWithOptions") {
            var _application: UIApplication!
            var options: [UIApplication.LaunchOptionsKey: Any]?

            beforeEach {
                _application = .shared
                options = nil
            }

            let when = {
                _ = application.application(_application, didFinishLaunchingWithOptions: options)
            }

            context("delegate is set") {
                var window: UIWindow?
                var applicationDelegate: StubApplicationDelegate!

                beforeEach {
                    applicationDelegate = .stub()
                    Stubber.register(applicationDelegate.getWindow) { window }
                    Stubber.register(applicationDelegate.setWindow) { window = $0 }

                    application.delegate = applicationDelegate

                    expect(application.delegate).toNot(beNil())
                }

                it("window to not be nil") {
                    when()

                    expect(application.window).toNot(beNil())
                }
                it("window.rootViewController to equal router.rootViewController") {
                    let rootViewController = UIViewController()
                    Stubber.register(router.getRootViewController) { rootViewController }

                    when()

                    expect(application.window?.rootViewController).to(equal(router.rootViewController))
                }
                it("router.presentRoot should be call one time") {
                    Stubber.register(router.presentRoot) { }

                    when()

                    expect(Stubber.executions(router.presentRoot).count).to(equal(1))
                }
            }
        }
    }
}
