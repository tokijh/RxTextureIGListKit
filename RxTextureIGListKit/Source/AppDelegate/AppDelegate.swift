//
//  AppDelegate.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

final class AppDelegate: UIResponder, AppDelegateType, FactoryModule {

    // MARK: - Lifecycle

    override convenience init() {
        let dependency: Dependency = Dependency.create()
        self.init(dependency: dependency)
    }

    init(dependency: Dependency) {
        self.application = dependency.application
        super.init()
        setup()
    }

    private func setup() {
        setupApplication()
    }

    // MARK: - Application

    let application: ApplicationType

    private func setupApplication() {
        application.delegate = self
    }

    // MARK: - AppDelegate

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        return self.application.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

// MARK: - Dependency

extension AppDelegate {
    struct Dependency {
        let application: ApplicationType

        static func create() -> Dependency {
            let application: ApplicationType = {
                let router: ApplicationRouterType = ApplicationRouter(dependency: .init())
                return Application.Factory(dependency: .init(router: router)).create()
            }()

            return .init(application: application)
        }
    }
}
