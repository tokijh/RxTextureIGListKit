//
//  RxListAdapterDataSourceType.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxSwift

public protocol RxListAdapterDataSourceType {
    associatedtype Element
    func listAdapter(_ adapter: ListAdapter, observedEvent: Event<Element>)
}
