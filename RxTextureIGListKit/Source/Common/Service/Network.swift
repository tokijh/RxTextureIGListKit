//
//  Network.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

enum NetworkError: Error {
    case undefined
    case invalidStatusCode
}

import RxSwift

extension Observable where E == Data {
    func map<T: Decodable>(_ decodable: T.Type) -> Observable<T> {
        return self.map({ try JSONDecoder().decode(T.self, from: $0) })
    }
}
