//
//  PayloadPureSpecs.swift
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

final class PayloadPureSpec: QuickSpec {

    typealias Dependency = PureTestSupportDependency
    typealias Payload = PureTestSupportPayload

    override func spec() {
        describe("a factory module") {
            it("creates an instance with a dependency and a payload") {
                let instance = PayloadFactoryFixture<Dependency, Payload>(
                    dependency: .init(networking: "Networking A"),
                    payload: .init(id: 100)
                )
                expect(instance.dependency.networking) == "Networking A"
                expect(instance.payload.id) == 100
            }

            it("creates an instance with a dependency when the module doesn't require a payload") {
                let instance = PayloadFactoryFixture<Dependency, Void>(
                    dependency: .init(networking: "Networking B")
                )
                expect(instance.dependency.networking) == "Networking B"
                expect(instance.payload) == Void()
            }

            it("creates an instance with a payload when the module doesn't require a dependency") {
                let instance = PayloadFactoryFixture<Void, Payload>(
                    payload: .init(id: 200)
                )
                expect(instance.dependency) == Void()
                expect(instance.payload.id) == 200
            }

            it("creates an instance when the module doesn't require a dependency and a payload") {
                let instance = PayloadFactoryFixture<Void, Void>()
                expect(instance.dependency) == Void()
                expect(instance.payload) == Void()
            }

            #if os(iOS) || os(tvOS) || os(macOS)
            context("when it is a view controller") {
                it("doesn't require init(dependency:payload:)") {
                    let viewController = ViewControllerPayloadFixture(dependency: "Dependency", payload: "Payload")
                    expect(viewController).toNot(beNil())
                }
            }
            #endif
        }

        describe("a configurator module") {
            it("configures an instance with a dependency and a payload") {
                let instance = PayloadConfiguratorFixture<Dependency, Payload>()
                instance.configure(dependency: .init(networking: "Networking A"), payload: .init(id: 100))
                expect(instance.dependency?.networking) == "Networking A"
                expect(instance.payload?.id) == 100
            }

            it("configures an instance with a dependency when the module doesn't require a payload") {
                let instance = PayloadConfiguratorFixture<Dependency, Void>()
                instance.configure(dependency: .init(networking: "Networking B"))
                expect(instance.dependency?.networking) == "Networking B"
                expect(instance.payload) == Void()
            }

            it("configures an instance with a payload when the module doesn't require a dependency") {
                let instance = PayloadConfiguratorFixture<Void, Payload>()
                instance.configure(payload: .init(id: 200))
                expect(instance.dependency) == Void()
                expect(instance.payload?.id) == 200
            }

            it("configures an instance when the module doesn't require a dependency and a payload") {
                let instance = PayloadConfiguratorFixture<Void, Void>()
                instance.configure()
                expect(instance.dependency) == Void()
                expect(instance.payload) == Void()
            }
        }

        describe("a factory") {
            it("creates an instance with a dependency and a payload") {
                let factory = PayloadFactoryFixture<Dependency, Payload>.Factory(dependency: .init(
                    networking: "Networking A"
                    ))
                let instance = factory.create(payload: .init(id: 100))
                expect(instance.dependency.networking) == "Networking A"
                expect(instance.payload.id) == 100
            }

            it("creates an instance with a dependency when the module doesn't require a payload") {
                let factory = PayloadFactoryFixture<Dependency, Void>.Factory(dependency: .init(
                    networking: "Networking B"
                    ))
                let instance = factory.create()
                expect(instance.dependency.networking) == "Networking B"
                expect(instance.payload) == Void()
            }

            it("creates an instance with a payload when the module doesn't require a dependency") {
                let factory = PayloadFactoryFixture<Void, Payload>.Factory()
                let instance = factory.create(payload: .init(id: 200))
                expect(instance.dependency) == Void()
                expect(instance.payload.id) == 200
            }

            it("creates an instance when the module doesn't require a dependency and a payload") {
                let factory = PayloadFactoryFixture<Void, Void>.Factory()
                let instance = factory.create()
                expect(instance.dependency) == Void()
                expect(instance.payload) == Void()
            }
        }

        describe("a configurator") {
            it("configures an instance with a dependency and a payload") {
                let instance = PayloadConfiguratorFixture<Dependency, Payload>()
                let configurator = PayloadConfiguratorFixture<Dependency, Payload>.Configurator(dependency: .init(
                    networking: "Networking A"
                    ))
                configurator.configure(instance, payload: .init(id: 100))
                expect(instance.dependency?.networking) == "Networking A"
                expect(instance.payload?.id) == 100
            }

            it("configures an instance with a dependency when the module doesn't require a payload") {
                let instance = PayloadConfiguratorFixture<Dependency, Void>()
                let configurator = PayloadConfiguratorFixture<Dependency, Void>.Configurator(dependency: .init(
                    networking: "Networking B"
                    ))
                configurator.configure(instance)
                expect(instance.dependency?.networking) == "Networking B"
                expect(instance.payload) == Void()
            }

            it("configures an instance with a payload when the module doesn't require a dependency") {
                let instance = PayloadConfiguratorFixture<Void, Payload>()
                let configurator = PayloadConfiguratorFixture<Void, Payload>.Configurator()
                configurator.configure(instance, payload: .init(id: 200))
                expect(instance.dependency) == Void()
                expect(instance.payload?.id) == 200
            }

            it("configures an instance when the module doesn't require a dependency and a payload") {
                let instance = PayloadConfiguratorFixture<Void, Void>()
                let configurator = PayloadConfiguratorFixture<Void, Void>.Configurator()
                configurator.configure(instance)
                expect(instance.dependency) == Void()
                expect(instance.payload) == Void()
            }
        }
    }
}
