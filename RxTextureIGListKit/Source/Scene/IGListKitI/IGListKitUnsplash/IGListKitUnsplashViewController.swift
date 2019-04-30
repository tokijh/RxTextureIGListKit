//
//  IGListKitUnsplashViewController.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 25/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

final class IGListKitUnsplashViewController: BaseNavigationController {

    override func setupView() {
        setupTabBarItem()
    }

    // MARK: - TabBarItem

    private func setupTabBarItem() {
        tabBarItem.title = "IGListKitUnsplash"
    }
}
