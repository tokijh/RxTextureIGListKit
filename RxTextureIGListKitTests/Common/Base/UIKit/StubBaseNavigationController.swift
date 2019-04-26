//
//  StubBaseNavigationController.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Stubber

final class StubBaseNavigationController: BaseNavigationController {

    override func setupView() {
        Stubber.invoke(setupView, args: (), default: ())
        super.setupView()
    }
}
