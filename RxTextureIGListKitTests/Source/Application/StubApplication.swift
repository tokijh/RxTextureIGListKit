//
//  StubApplication.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import UIKit

import Stubber

final class StubApplication: ApplicationType, FactoryModule {

    // MARK: - Property

    let depenendcy: Dependency

    // MARK: - Lifecycle

    init(dependency: Dependency = .stub()) {
        self.depenendcy = dependency
    }

    // MARK: - Application

    weak var delegate: ApplicationDelegate?

    @discardableResult
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        return Stubber.invoke(
            self.application,
            args: (application: application, launchOptions: launchOptions),
            default: true
        )
    }

    // MARK: - Router

    var router: ApplicationRouterType { return depenendcy.router }
}

// MARK: - Stub

extension StubApplication {
    typealias Dependency = Application.Dependency
}

extension Application {
    static func stub(dependeny: Dependency = .stub()) -> StubApplication {
        return StubApplication(dependency: dependeny)
    }
}

extension Application.Dependency {
    static func stub(
        router: ApplicationRouterType = ApplicationRouter.stub()
        ) -> Application.Dependency {
        return .init(
            router: router
        )
    }
}
