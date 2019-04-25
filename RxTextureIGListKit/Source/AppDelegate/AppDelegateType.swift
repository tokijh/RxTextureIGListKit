//
//  AppDelegateType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

protocol AppDelegateType: UIApplicationDelegate, ApplicationDelegate {

    // MARK: - Property

    var application: ApplicationType { get }

    // MARK: - UIApplicationDelegate

    var window: UIWindow? { get set }

    @discardableResult
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool
}
