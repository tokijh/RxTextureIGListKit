//
//  PayloadConfiguratorModule.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

/// A module that can be configurated with an existing instance.
public protocol PayloadConfiguratorModule: class, PayloadModule {

    /// A configurator for `Self`.
    associatedtype Configurator = RxTextureIGListKit.PayloadConfigurator<Self>

    /// Configures an existing module with a dependency and a payload.
    func configure(dependency: Dependency, payload: Payload)
}

public extension PayloadConfiguratorModule where Dependency == Void {
    /// Configures an existing module with a payload.
    func configure(payload: Payload) {
        self.configure(dependency: Void(), payload: payload)
    }
}

public extension PayloadConfiguratorModule where Payload == Void {
    /// Configures an existing module with a dependency.
    func configure(dependency: Dependency) {
        self.configure(dependency: dependency, payload: Void())
    }
}

public extension PayloadConfiguratorModule where Dependency == Void, Payload == Void {
    /// Configures an existing module.
    func configure() {
        self.configure(dependency: Void(), payload: Void())
    }
}
