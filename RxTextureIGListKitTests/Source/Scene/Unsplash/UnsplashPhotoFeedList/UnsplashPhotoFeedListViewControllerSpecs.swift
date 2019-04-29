//
//  UnsplashPhotoFeedListViewControllerSpecs.swift
//  RxTextureIGListKitTests
//
//  Created by 윤중현 on 29/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

@testable import RxTextureIGListKit

import Nimble
import Quick
import Stubber

final class UnsplashPhotoFeedListViewControllerSpecs: QuickSpec {

    // MARK: - Spec

    override func spec() {

        // MARK: - Property

        var reactor: UnsplashPhotoFeedListViewReactor!
        var vc: UnsplashPhotoFeedListViewController!

        beforeEach {
            reactor = .stub()
            vc = UnsplashPhotoFeedListViewController(dependency: .stub(reactor: reactor))
        }

        describe("when viewDidLoad") {
            let when = {
                vc = UnsplashPhotoFeedListViewController(dependency: .stub(reactor: reactor))
                vc.viewDidLoad()
            }

            it("action emit .initialize") {
                reactor.stub.isEnabled = true

                when()

                expect(reactor.stub.actions).to(equal([.initialize]))
            }
        }
    }
}
