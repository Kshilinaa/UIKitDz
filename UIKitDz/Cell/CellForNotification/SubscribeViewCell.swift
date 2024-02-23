// SubscribeViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с кнопкой
final class SubscribeViewCell: UITableViewCell {
    // MARK: - Constants

    /// Идентификатор ячейки Подписаться
    static let identifier = "SubscribeViewCell"
    /// Изображение пользователя
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    /// Текст комментария
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    /// Кнопка подписаться
    private let buttonPost: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.setTitle("Подписаться", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        return button
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
        contentView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        contentView.backgroundColor = .white

        contentView.addSubview(userImageView)
        contentView.addSubview(commentLabel)
        contentView.addSubview(buttonPost)

        makeUserImage()
        makeCommentLabel()
        makeButton()
    }

    /// Ограничения для изображения пользователя
    private func makeUserImage() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    /// Ограничения для текста комментария
    private func makeCommentLabel() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 154).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
    }

    /// Ограничения для кнопки подписаться
    private func makeButton() {
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        buttonPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        buttonPost.widthAnchor.constraint(equalToConstant: 140).isActive = true
        buttonPost.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
    }

    // MARK: - public methods

    /// Настройка ячейки уведомления на основе информации из уведомления
    func configure(info: NotificationModel) {
        userImageView.image = UIImage(named: info.profileImage)
        commentLabel.text = info.text
    }
}
