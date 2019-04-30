//
//  RxSwift.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import RxSwift

extension ObservableType {
    func catchErrorJustComplete() -> Observable<E> {
        return self.catchError({ _ in return .empty() })
    }
}
