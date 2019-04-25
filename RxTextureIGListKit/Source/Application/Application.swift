//
//  Application.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

import Pure
import Then

final class Application: ApplicationType, FactoryModule {

    // MARK: - Property

    let router: ApplicationRouterType

    // MARK: - Lifecycle

    init(dependency: Dependency, payload: ()) {
        self.router = dependency.router
    }

    // MARK: - Application

    weak var delegate: ApplicationDelegate?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        return true
    }
}

// MARK: - Dependency

extension Application {
    struct Dependency {
        let router: ApplicationRouterType
    }
}

protocol ApplicationDependency {
    var router: ApplicationRouterType { get }
}
