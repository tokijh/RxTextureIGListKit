//
//  UnsplashPhotoFeedSectionControllerSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class UnsplashPhotoFeedSectionControllerSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var controller: UnsplashPhotoFeedSectionController!

        beforeEach {
            controller = UnsplashPhotoFeedSectionController()
        }

        describe("when didUpdate") {
            var object: Any!

            let when = {
                controller.didUpdate(to: object as Any)
            }

            context("object is DiffableBox<UnsplashPhotoFeedListItem>") {
                let photoFeedID = "3289"
                beforeEach {
                    object = DiffableBox<UnsplashPhotoFeedListItem>(.photoFeed(UnsplashPhotoFeed.stub(id: photoFeedID)))
                    expect(object is DiffableBox<UnsplashPhotoFeedListItem>).to(beTrue())
                }

                it("state.photoFeed is equal object") {
                    when()

                    expect(controller.currentState.photoFeed.id).to(equal(photoFeedID))
                }
            }
        }
    }
}
