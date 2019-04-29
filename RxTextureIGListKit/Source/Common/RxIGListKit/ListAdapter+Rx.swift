//
//  ListAdapter+Rx.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 28/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxCocoa
import RxSwift

extension Reactive where Base: ListAdapter {
    public var dataSource: DelegateProxy<ListAdapter, ListAdapterDataSource> {
        return RxListAdapterDataSourceProxy.proxy(for: base)
    }

    public func setDataSource(_ dataSource: ListAdapterDataSource)
        -> Disposable {
            return RxListAdapterDataSourceProxy
                .installForwardDelegate(
                    dataSource,
                    retainDelegate: true,
                    onProxyForObject: self.base
            )
    }
}
