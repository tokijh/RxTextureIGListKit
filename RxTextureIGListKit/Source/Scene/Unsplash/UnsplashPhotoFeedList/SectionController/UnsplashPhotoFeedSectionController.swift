//
//  UnsplashPhotoFeedSectionController.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import AsyncDisplayKit
import IGListKit
import ReactorKit
import RxSwift

final class UnsplashPhotoFeedSectionController: ListSectionController, ASSectionController, View {

    // MARK: - Typealias

    typealias Reactor = UnsplashPhotoFeedSectionReactor

    // MARK: - Property

    var disposeBag = DisposeBag()

    // MARK: - Texture

    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        return {
            let node = ASTextCellNode()
            node.text = "hi"
            return node
        }
    }

    // MARK: - IGListKit

    override func numberOfItems() -> Int {
        return 10
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }

    // MARK: - Reactor

    func bind(reactor: Reactor) {

    }
}
