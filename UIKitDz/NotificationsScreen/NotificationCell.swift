// NotificationCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для фото и комментария в уведомлении
final class NotificationCell: UITableViewCell {
    // MARK: - Constants

    /// Идентификатор ячейки уведомления
    static let identifier = "NotificationCell"

    // MARK: - Private properties

    /// Изображение комментария
    private let commentImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    /// Метка комментария
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()

    /// Изображение пользователя
    private let avatarUserImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    /// Настройка пользовательского интерфейса ячейки
    private func setupUI() {
        contentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentView.backgroundColor = .white
        contentView.addSubview(avatarUserImageView)
        contentView.addSubview(commentLabel)
        contentView.addSubview(commentImageView)
        setupUserImage()
        setupCommentLabel()
        setupCommentImageView()
    }

    /// Ограничения изображения пользователя
    private func setupCommentLabel() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: avatarUserImageView.trailingAnchor, constant: 10).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Огрнаичения метки комментария
    private func setupCommentImageView() {
        commentImageView.translatesAutoresizingMaskIntoConstraints = false
        commentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    }

    /// Ограничения изображения комментария
    private func setupUserImage() {
        avatarUserImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarUserImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        avatarUserImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        avatarUserImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarUserImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarUserImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }

    // MARK: - Methods

    /// Настройка ячейки на основе информации о уведомлении
    func configure(info: NotificationModel) {
        avatarUserImageView.image = UIImage(named: info.profileImage)
        commentLabel.text = info.text
        commentImageView.image = UIImage(named: info.postImage)
    }
}
