//
//  PayloadedFactory.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

public protocol PayloadModule {
    associatedtype Dependency = Void
    associatedtype Payload = Void
}
