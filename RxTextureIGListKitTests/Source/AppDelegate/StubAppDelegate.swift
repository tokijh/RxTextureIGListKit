//
//  StubAppDelegate.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import UIKit

import Pure
import Stubber

final class StubAppDelegate: UIResponder, AppDelegateType, FactoryModule {

    // MARK: - Property

    let depenendcy: Dependency

    // MARK: - Lifecycle

    override convenience init() {
        self.init(dependency: .stub())
    }

    init(dependency: Dependency = .stub(), payload: () = ()) {
        self.depenendcy = dependency
    }

    // MARK: - Application

    var application: ApplicationType { return depenendcy.application }

    // MARK: - AppDelegateType

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        return true
    }
}

// MARK: - Dependency

extension StubAppDelegate {
    typealias Dependency = AppDelegate.Dependency
}

extension AppDelegate {
    static func stub(dependeny: Dependency = .stub()) -> StubAppDelegate {
        return StubAppDelegate(dependency: dependeny)
    }
}

extension AppDelegate.Dependency {
    static func stub(
        application: ApplicationType = Application.stub()
        ) -> AppDelegate.Dependency {
        return .init(
            application: application
        )
    }
}
