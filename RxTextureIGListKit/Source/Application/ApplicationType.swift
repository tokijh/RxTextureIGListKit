//
//  ApplicationType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

protocol ApplicationType: class {

    // MARK: - Property

    var delegate: ApplicationDelegate? { get set }

    // MARK: - AppDelegate

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool

    // MARK: - Router

    var router: ApplicationRouterType { get }
}

// MARK: - AppDelegate

extension ApplicationType {
    var window: UIWindow? {
        get { return delegate?.window }
        set(newWindow) { delegate?.window = newWindow }
    }
}

// MARK: - ApplicationDelegate

protocol ApplicationDelegate: class {
    var window: UIWindow? { get set }
}
