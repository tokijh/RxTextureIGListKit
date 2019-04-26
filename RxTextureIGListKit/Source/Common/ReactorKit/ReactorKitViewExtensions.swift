//
//  ReactorKitViewExtensions.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import ReactorKit

import AsyncDisplayKit
import UIKit

extension View where Self: UIViewController {
    public init(reactor: Reactor) {
        self.init()
        self.reactor = reactor
    }
}
