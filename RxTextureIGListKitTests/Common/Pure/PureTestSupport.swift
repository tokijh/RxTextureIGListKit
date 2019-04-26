//
//  PureTestSupport.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

struct PureTestSupportDependency {
    let networking: String
    init(networking: String) {
        self.networking = networking
    }
}

struct PureTestSupportPayload {
    let id: Int
    init(id: Int) {
        self.id = id
    }
}

class FactoryFixture<DependencyType>: FactoryModule {
    typealias Dependency = DependencyType

    let dependency: Dependency

    required init(dependency: Dependency) {
        self.dependency = dependency
    }
}

class ConfiguratorFixture<DependencyType>: ConfiguratorModule {
    typealias Dependency = DependencyType

    var dependency: Dependency?

    func configure(dependency: Dependency) {
        self.dependency = dependency
    }
}

class PayloadFactoryFixture<DependencyType, PayloadType>: PayloadFactoryModule {
    typealias Dependency = DependencyType
    typealias Payload = PayloadType

    let dependency: Dependency
    let payload: Payload

    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
    }
}

class PayloadConfiguratorFixture<DependencyType, PayloadType>: PayloadConfiguratorModule {
    typealias Dependency = DependencyType
    typealias Payload = PayloadType

    var dependency: Dependency?
    var payload: Payload?

    func configure(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
    }
}

#if os(iOS) || os(tvOS)
import UIKit

class ViewControllerFixture: UIViewController, FactoryModule {
    typealias Dependency = String
}

class ViewControllerPayloadFixture: UIViewController, PayloadFactoryModule {
    typealias Dependency = String
    typealias Payload = String
}
#endif

#if os(macOS)
import AppKit

class ViewControllerFixture: NSViewController, FactoryModule {
    typealias Dependency = String
}

class ViewControllerPayloadFixture: NSViewController, PayloadFactoryModule {
    typealias Dependency = String
    typealias Payload = String
}
#endif
