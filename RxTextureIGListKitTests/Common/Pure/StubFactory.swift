//
//  StubFactory.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

public extension Factory {
    static func stub(
        _ closure: @escaping () -> Module?
        ) -> StubFactory<Module> {
        let factory = StubFactory<Module>()
        factory.register(closure)
        return factory
    }

    static func stub(
        _ instance: @autoclosure @escaping () -> Module? = nil
        ) -> StubFactory<Module> {
        let factory = StubFactory<Module>()
        factory.register(instance)
        return factory
    }
}

public final class StubFactory<Module: FactoryModule>: Factory<Module> {

    private var closure: () -> Module?

    public func register(_ closure: @escaping () -> Module?) {
        self.closure = closure
    }

    public func register(_ instance: @autoclosure @escaping () -> Module?) {
        self.closure = { instance() }
    }

    @available(*, unavailable)
    public override var dependency: Module.Dependency {
        return super.dependency
    }

    fileprivate init(_ ignore: Void = ()) {
        closure = { nil }
        super.init(dependency: (nil as Module.Dependency?)!)
    }

    override public func create() -> Module {
        return closure()!
    }
}
