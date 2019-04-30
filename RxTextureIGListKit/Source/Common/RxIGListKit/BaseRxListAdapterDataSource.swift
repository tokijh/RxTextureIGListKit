//
//  BaseRxListAdapterDataSource.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxCocoa
import RxSwift

open class BaseRxListAdapterDataSource<M: Diffable>: RxListAdapterDataSource<M>, RxListAdapterDataSourceType {

    public typealias Element = [M]

    public func listAdapter(_ adapter: ListAdapter, observedEvent: Event<Element>) {
        Binder(self) { dataSource, models in
            dataSource.setModels(models)
            adapter.performUpdates(animated: true)
        }
            .on(observedEvent)
    }
}
