//
//  ListSectionController+Rx.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit
import RxSwift

extension Reactive where Base: ListSectionController {
    func didUpdate<T>(_ type: T.Type,
                      notMatchedObservable: Observable<T> = .empty()
        ) -> Observable<T> {
        return self.methodInvoked(#selector(base.didUpdate(to:)))
            .flatMap({ value -> Observable<T> in
                guard let value = value[0] as? T
                    else {
                        return notMatchedObservable
                }
                return Observable.just(value)
            })
    }

    func didUpdateWithDiffable<T: Diffable>(_ type: T.Type,
                                            notMatchedObservable: Observable<T> = .empty()
        ) -> Observable<T> {
        return self.methodInvoked(#selector(base.didUpdate(to:)))
            .flatMap({ value -> Observable<T> in
                guard let value = value[0] as? DiffableBox<T>
                    else {
                        return notMatchedObservable
                }
                return Observable.just(value.diffable)
            })
    }
}
