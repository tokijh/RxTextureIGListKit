//
//  StubApplicationDelegate.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import UIKit

import Stubber

final class StubApplicationDelegate: ApplicationDelegate {
    var window: UIWindow? {
        get { return getWindow() }
        set { setWindow(window: newValue) }
    }
}

extension StubApplicationDelegate {
    func getWindow() -> UIWindow? {
        return Stubber.invoke(self.getWindow, args: (), default: nil)
    }

    func setWindow(window: UIWindow?) {
        Stubber.invoke(self.setWindow, args: (window), default: ())
    }
}

// MARK: - Stub

extension ApplicationDelegate {
    static func stub() -> StubApplicationDelegate {
        return StubApplicationDelegate()
    }
}
