//
//  Diffable.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import IGListKit

public protocol Diffable {
    func diffIdentifier() -> NSObjectProtocol
    func isEqual(to object: Self) -> Bool
}

extension Diffable {
    var listDiffable: ListDiffable {
        return DiffableBox<Self>(self)
    }
}

final class DiffableBox<T: Diffable>: ListDiffable {

    let diffable: T

    init(_ diffable: T) {
        self.diffable = diffable
    }

    // MARK: - ListDiffable

    func diffIdentifier() -> NSObjectProtocol {
        return diffable.diffIdentifier()
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? DiffableBox<T>
            else { return false }
        return diffable.isEqual(to: object.diffable)
    }
}
