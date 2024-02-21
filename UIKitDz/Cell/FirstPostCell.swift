// FirstPostCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс для создания ячейки с первым постом
class FirstPostCell: UITableViewCell {
    static let identifier = "FirstPostCell"

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let pointsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pointsImage")
        imageView.contentMode = .center
        return imageView
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let chatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chatImage1"), for: .normal)
        return button
    }()

    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heartImage"), for: .normal)
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "repostImage"), for: .normal)
        return button
    }()

    private let saveImageView: UIButton = {
        let imageView = UIButton()
        imageView.setImage(UIImage(named: "saveImage"), for: .normal)
        return imageView
    }()

    private let avatarCommentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smallAvatarImage")
        return imageView
    }()

    private let nameTitle: UILabel = {
        let label = UILabel()
        return label
    }()

    private let likesCount: UILabel = {
        let label = UILabel()
        return label
    }()

    private let postDescription: UILabel = {
        let label = UILabel()
        return label
    }()

    private let commenting: UILabel = {
        let label = UILabel()
        return label
    }()

    private let tenMiAgo: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(avatarImageView)
        contentView.addSubview(pointsImageView)
        contentView.addSubview(postImageView)
        contentView.addSubview(chatButton)
        contentView.addSubview(heartButton)
        contentView.addSubview(sendButton)
        contentView.addSubview(saveImageView)
        contentView.addSubview(avatarCommentImageView)
        // contentView.addSubview(nameTitle)
        // contentView.addSubview(likes)
        contentView.addSubview(postDescription)
        contentView.addSubview(commenting)
        contentView.addSubview(tenMiAgo)
        contentView.addSubview(nameTitle)
        contentView.addSubview(likesCount)

        makeAvatarImageViewConstraints()
        makePostImageViewConstraints()
        makePointsImageViewConstraints()
        makeHeartImageViewConstraints()
        makeChatImageViewConstraints()
        makeSendImageViewConstraints()
        makeBookmarkImageViewConstraints()
        makeMiniAvaImageViewConstraints()
        makeNameTitleConstraints()
        makeLikeLableConstrains()
        postDescriptionLabelConstraints()
        commentingLabelConstraints()
        tenMinAgoLabelConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp(posts: Post) {
        avatarImageView.image = UIImage(named: posts.avatarName)
        postImageView.image = UIImage(named: posts.postImages[0])
        nameTitle.text = posts.nameTitle
        likesCount.text = posts.likesCount
        postDescription.text = posts.postDescription
        commenting.text = posts.commenting
        tenMiAgo.text = posts.tenMiAgo
    }

    private func makeAvatarImageViewConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func makePostImageViewConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
        postImageView.backgroundColor = .yellow
    }

    private func makePointsImageViewConstraints() {
        pointsImageView.translatesAutoresizingMaskIntoConstraints = false
        pointsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        pointsImageView.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -10).isActive = true
        pointsImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        pointsImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeHeartImageViewConstraints() {
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        heartButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        heartButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeChatImageViewConstraints() {
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        chatButton.leadingAnchor.constraint(equalTo: heartButton.trailingAnchor, constant: 8).isActive = true
        chatButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        chatButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        chatButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeSendImageViewConstraints() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.leadingAnchor.constraint(equalTo: chatButton.trailingAnchor, constant: 8).isActive = true
        sendButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeBookmarkImageViewConstraints() {
        saveImageView.translatesAutoresizingMaskIntoConstraints = false
        saveImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9)
            .isActive = true
        saveImageView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true
        saveImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        saveImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func makeMiniAvaImageViewConstraints() {
        avatarCommentImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarCommentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        avatarCommentImageView.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 60).isActive = true
        avatarCommentImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        avatarCommentImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeNameTitleConstraints() {
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 48).isActive = true
        nameTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameTitle.font = UIFont(name: "Verdana-Bold", size: 12)
    }

    private func makeLikeLableConstrains() {
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        likesCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        likesCount.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 0).isActive = true
        likesCount.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likesCount.heightAnchor.constraint(equalToConstant: 20).isActive = true
        likesCount.font = UIFont(name: "Verdana-Bold", size: 11)
    }

    private func postDescriptionLabelConstraints() {
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        postDescription.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 18).isActive = true
        postDescription.widthAnchor.constraint(equalToConstant: 361).isActive = true
        postDescription.heightAnchor.constraint(equalToConstant: 40).isActive = true
        postDescription.numberOfLines = 2
        postDescription.font = UIFont(name: "Verdana", size: 11)
    }

    private func commentingLabelConstraints() {
        commenting.translatesAutoresizingMaskIntoConstraints = false
        commenting.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35)
            .isActive = true
        commenting.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 60).isActive = true
        commenting.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commenting.heightAnchor.constraint(equalToConstant: 15).isActive = true
        commenting.font = UIFont(name: "Verdana", size: 10)
        commenting.textColor = .lightGray
    }

    private func tenMinAgoLabelConstraints() {
        tenMiAgo.translatesAutoresizingMaskIntoConstraints = false
        tenMiAgo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        tenMiAgo.topAnchor.constraint(equalTo: heartButton.bottomAnchor, constant: 85).isActive = true
        tenMiAgo.widthAnchor.constraint(equalToConstant: 150).isActive = true
        tenMiAgo.heightAnchor.constraint(equalToConstant: 15).isActive = true
        tenMiAgo.font = UIFont(name: "Verdana", size: 10)
        tenMiAgo.textColor = .lightGray
    }
}
