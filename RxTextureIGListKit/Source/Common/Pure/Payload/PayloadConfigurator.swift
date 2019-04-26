//
//  PayloadConfigurator.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

/// A generic configurator. It is constructed with a static dependency and configures an existing
/// module instance with a runtime parameter.
open class PayloadConfigurator<Module: PayloadConfiguratorModule> {
    private let dependencyClosure: () -> Module.Dependency

    /// A static dependency of a module.
    open var dependency: Module.Dependency {
        return self.dependencyClosure()
    }

    /// Creates an instance of `Configurator`.
    ///
    /// - parameter dependency: A static dependency which should be resolved in a composition root.
    public init(dependency: @autoclosure @escaping () -> Module.Dependency) {
        self.dependencyClosure = dependency
    }

    /// Configures an existing module instance with a runtime parameter.
    ///
    /// - parameter module: An instance of a module to be configured.
    /// - parameter payload: A runtime parameter which is required to configure a module.
    open func configure(_ module: Module, payload: Module.Payload) {
        module.configure(dependency: self.dependency, payload: payload)
    }
}

public extension PayloadConfigurator where Module.Payload == Void {
    /// Configures an existing module instance with a runtime parameter.
    ///
    /// - parameter module: An instance of a module to be configured.
    func configure(_ module: Module) {
        self.configure(module, payload: Void())
    }
}

public extension PayloadConfigurator where Module.Dependency == Void {
    /// Creates an instance of `Configurator`.
    convenience init() {
        self.init(dependency: Void())
    }
}
