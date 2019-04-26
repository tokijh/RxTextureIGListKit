//
//  PayloadFactoryModule.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

/// A module that can be constructed with a factory.
public protocol PayloadFactoryModule: PayloadModule {

    /// A factory for `Self`.
    associatedtype Factory = RxTextureIGListKit.PayloadFactory<Self>

    /// Creates an instance of a module with a dependency and a payload.
    init(dependency: Dependency, payload: Payload)
}

public extension PayloadFactoryModule where Dependency == Void {
    /// Creates an instance of a module with a payload.
    init(payload: Payload) {
        self.init(dependency: Void(), payload: payload)
    }
}

public extension PayloadFactoryModule where Payload == Void {
    /// Creates an instance of a module with a dependency.
    init(dependency: Dependency) {
        self.init(dependency: dependency, payload: Void())
    }
}

public extension PayloadFactoryModule where Dependency == Void, Payload == Void {
    /// Creates an instance of a module.
    init() {
        self.init(dependency: Void(), payload: Void())
    }
}

#if os(iOS) || os(tvOS)
import UIKit

public extension PayloadFactoryModule where Self: UIViewController {
    init(dependency: Dependency, payload: Payload) {
        self.init(nibName: nil, bundle: nil)
    }
}
#endif

#if os(macOS)
import AppKit

public extension PayloadFactoryModule where Self: NSViewController {
    init(dependency: Dependency, payload: Payload) {
        self.init(nibName: nil, bundle: nil)
    }
}
#endif
