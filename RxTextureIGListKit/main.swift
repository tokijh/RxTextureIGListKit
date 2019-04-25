//
//  main.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import UIKit

private func isTesting() -> Bool {
    return NSClassFromString("XCTestCase") != nil
}

private func appDelegateClassName() -> String {
    return isTesting() ? "RxTextureIGListKitTests.StubAppDelegate" : NSStringFromClass(AppDelegate.self)
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    NSStringFromClass(UIApplication.self),
    appDelegateClassName()
)
