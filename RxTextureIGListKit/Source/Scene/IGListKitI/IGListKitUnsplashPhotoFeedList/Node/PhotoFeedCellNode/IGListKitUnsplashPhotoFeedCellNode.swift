//
//  UnsplashPhotoFeedCellNode.swift
//  RxTextureIGListKit
//
//  Created by 윤중현 on 26/04/2019.
//  Copyright © 2019 tokijh. All rights reserved.
//

import AsyncDisplayKit

final class UnsplashPhotoFeedCellNode: ASCellNode {

    let userProfileImageNode = ASNetworkImageNode()
        .then({
            $0.contentMode = .scaleAspectFill
            // Set the imageModificationBlock for a rounded avatar
            $0.imageModificationBlock = ASImageNodeRoundBorderModificationBlock(0, nil)
        })
    let usernameLabel = ASTextNode()
    let timeIntervalLabel = ASTextNode()

    let photoImageNode = ASNetworkImageNode()
        .then({
            $0.contentMode = .scaleAspectFill
        })

    let photoLikesLabel = ASTextNode()
    let photoDescriptionLabel = ASTextNode()

    init(photoFeed: UnsplashPhotoFeed) {
        super.init()

        automaticallyManagesSubnodes = true
        setup(photoFeed: photoFeed)
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var headerChildren: [ASLayoutElement] = []

        let headerStack = ASStackLayoutSpec.horizontal()
        headerStack.alignItems = .center
        userProfileImageNode.style.preferredSize = CGSize(width: 30, height: 30)
        headerChildren.append(ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10),
            child: userProfileImageNode
        ))

        usernameLabel.style.flexShrink = 1.0
        headerChildren.append(usernameLabel)

        let spacer = ASLayoutSpec()
        spacer.style.flexGrow = 1.0
        headerChildren.append(spacer)

        timeIntervalLabel.style.spacingBefore = 10
        headerChildren.append(timeIntervalLabel)

        let footerStack = ASStackLayoutSpec.vertical()
        footerStack.spacing = 5
        footerStack.children = [photoLikesLabel, photoDescriptionLabel]
        headerStack.children = headerChildren

        let verticalStack = ASStackLayoutSpec.vertical()
        verticalStack.children = [
            ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), child: headerStack),
            ASRatioLayoutSpec(ratio: 1.0, child: photoImageNode),
            ASInsetLayoutSpec(insets: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10), child: footerStack)
        ]
        return verticalStack
    }
}

extension UnsplashPhotoFeedCellNode {
    private func setup(photoFeed: UnsplashPhotoFeed) {
        userProfileImageNode.url = userProfileImageURL(user: photoFeed.user)
        usernameLabel.attributedText = attributedStringForUserName(user: photoFeed.user)
        timeIntervalLabel.attributedText = attributedStringForTimeUploadedDate(photoFeed: photoFeed)
        photoImageNode.url = photoImageURL(photoFeed: photoFeed)
        photoLikesLabel.attributedText = attributedStringLikes(likesCount: photoFeed.likesCount)
        photoDescriptionLabel.attributedText = attributedStringForDescription(photoFeed: photoFeed)
    }

    private func userProfileImageURL(user: UnsplashUser?) -> URL? {
        guard let mediumURLString = user?.profileImage.medium else { return nil }

        return URL(string: mediumURLString)
    }

    private func photoImageURL(photoFeed: UnsplashPhotoFeed) -> URL? {
        guard let regularURLString = photoFeed.urls?.regular else { return nil }

        return URL(string: regularURLString)
    }

    private func attributedStringForUserName(user: UnsplashUser?) -> NSAttributedString? {
        guard let userName = user?.userName else { return nil }

        return NSAttributedString(
            string: userName,
            attributes: [
                .foregroundColor: UIColor.darkGray,
                .font: UIFont.boldSystemFont(ofSize: 12)
            ])
    }

    private func attributedStringForTimeUploadedDate(photoFeed: UnsplashPhotoFeed) -> NSAttributedString? {
        guard let uploadedDateString = photoFeed.uploadedDateString,
            let date = Date.iso8601Formatter.date(from: uploadedDateString)
            else { return nil }

        return NSAttributedString(
            string: Date.timeStringSince(fromConverted: date),
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 12)
            ])
    }

    private func attributedStringForDescription(photoFeed: UnsplashPhotoFeed) -> NSAttributedString? {
        guard let description = photoFeed.description else { return nil }

        return NSAttributedString(
            string: description,
            attributes: [
                .foregroundColor: UIColor.darkGray,
                .font: UIFont.systemFont(ofSize: 12)
            ])
    }

    private func attributedStringLikes(likesCount: Int) -> NSAttributedString? {
        let numberFormatter = NumberFormatter().then({ $0.numberStyle = .decimal })
        guard let formattedLikesNumber = numberFormatter.string(from: NSNumber(value: likesCount))
            else {
            return nil
        }

        let likesAttrString = NSAttributedString(
            string: "\(formattedLikesNumber) Likes",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 12)
            ])

        let heartAttrString = NSAttributedString(
            string: "♥︎ ",
            attributes: [
                .foregroundColor: UIColor.red,
                .font: UIFont.systemFont(ofSize: 12)
            ])

        let combine = NSMutableAttributedString()
        combine.append(heartAttrString)
        combine.append(likesAttrString)
        return combine
    }
}
