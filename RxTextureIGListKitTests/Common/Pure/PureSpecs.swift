//
//  PureSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif
import Nimble
import Quick
@testable import RxTextureIGListKit

final class PureSpec: QuickSpec {

    typealias Dependency = PureTestSupportDependency

    override func spec() {
        describe("a factory module") {
            it("creates an instance with a dependency") {
                let instance = FactoryFixture<Dependency>(
                    dependency: .init(networking: "Networking A")
                )
                expect(instance.dependency.networking) == "Networking A"
            }

            it("creates an instance when the module doesn't require a dependency") {
                let instance = FactoryFixture<Void>()
                expect(instance.dependency) == Void()
            }

            #if os(iOS) || os(tvOS) || os(macOS)
            context("when it is a view controller") {
                it("doesn't require init(dependency:)") {
                    let viewController = ViewControllerFixture(dependency: "Dependency")
                    expect(viewController).toNot(beNil())
                }
            }
            #endif
        }

        describe("a configurator module") {
            it("configures an instance with a dependency") {
                let instance = ConfiguratorFixture<Dependency>()
                instance.configure(dependency: .init(networking: "Networking A"))
                expect(instance.dependency?.networking) == "Networking A"
            }

            it("configures an instance when the module doesn't require a dependency") {
                let instance = ConfiguratorFixture<Void>()
                instance.configure()
                expect(instance.dependency) == Void()
            }
        }

        describe("a factory") {
            it("creates an instance with a dependency") {
                let factory = FactoryFixture<Dependency>.Factory(dependency: .init(
                    networking: "Networking A"
                    ))
                let instance = factory.create()
                expect(instance.dependency.networking) == "Networking A"
            }

            it("creates an instance when the module doesn't require a dependency") {
                let factory = FactoryFixture<Void>.Factory()
                let instance = factory.create()
                expect(instance.dependency) == Void()
            }
        }

        describe("a configurator") {
            it("configures an instance with a dependency") {
                let instance = ConfiguratorFixture<Dependency>()
                let configurator = ConfiguratorFixture<Dependency>.Configurator(dependency: .init(
                    networking: "Networking A"
                    ))
                configurator.configure(instance)
                expect(instance.dependency?.networking) == "Networking A"
            }

            it("configures an instance when the module doesn't require a dependency") {
                let instance = ConfiguratorFixture<Void>()
                let configurator = ConfiguratorFixture<Void>.Configurator()
                configurator.configure(instance)
                expect(instance.dependency) == Void()
            }
        }
    }
}
