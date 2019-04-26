//
//  PayloadFactory.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

open class PayloadFactory<Module: PayloadFactoryModule> {
    private let dependencyClosure: () -> Module.Dependency

    /// A static dependency of a module.
    open var dependency: Module.Dependency {
        return self.dependencyClosure()
    }

    /// Creates an instance of `Factory`.
    ///
    /// - parameter dependency: A static dependency which should be resolved in a composition root.
    public init(dependency: @autoclosure @escaping () -> Module.Dependency) {
        self.dependencyClosure = dependency
    }

    /// Creates an instance of a module with a runtime parameter.
    ///
    /// - parameter payload: A runtime parameter which is required to construct a module.
    open func create(payload: Module.Payload) -> Module {
        return Module(dependency: self.dependency, payload: payload)
    }
}

public extension PayloadFactory where Module.Payload == Void {
  /// Creates an instance of a module.
  func create() -> Module {
    return Module(dependency: self.dependency, payload: Void())
  }
}

public extension PayloadFactory where Module.Dependency == Void {
  /// Creates an instance of `Factory`.
  convenience init() {
    self.init(dependency: Void())
  }
}
