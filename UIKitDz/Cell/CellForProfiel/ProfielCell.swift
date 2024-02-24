// ProfielCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка профиля пользователя
final class ProfielCell: UITableViewCell {
    // MARK: - Constants

    /// Идентификатор ячейки профиля
    static let identifier = "ProfielCell"

    // MARK: - Private properties

    /// Изображение аватара пользователя
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    /// Лейбл для количества публикаций
    private let postCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        return label
    }()

    /// Лейбл для текста "публикации"
    private let postLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 11)
        label.textAlignment = .left
        return label
    }()

    /// Лейбл для количества подписчиков
    private let subscribersCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        return label
    }()

    /// Лейбл для текста "подписчики"
    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 11)
        label.textAlignment = .left
        return label
    }()

    /// Лейбл для количества подписок
    private let subscriptionsCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        return label
    }()

    /// Лейбл для текста "подписки"
    private let subscriptionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 11)
        label.textAlignment = .left
        return label
    }()

    /// Лейбл с именем пользователя
    private let nameProfielLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 11)
        return label
    }()

    /// Лейбл с профессией пользователя
    private let professionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 11)
        return label
    }()

    /// Лейбл для кнопки изменения профиля
    private let changeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 10)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.backgroundColor = UIColor(named: "newBackgroandColor")
        return label
    }()

    /// Лейбл для кнопки публикации профиля
    private let shareProfielLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 10)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.backgroundColor = UIColor(named: "newBackgroandColor")
        return label
    }()

    /// Иконка изображения
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(named: "newBackgroandColor")
        return imageView
    }()

    /// Кнопка для открытия веб-сайта
    private let buttonWeb: UIButton = {
        let webSite = UIButton()
        webSite.setTitle(" 📎 www.spacex.com", for: .normal)
        webSite.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        webSite.setTitleColor(.blue, for: .normal)
        webSite.titleLabel?.textAlignment = .left
        return webSite
    }()

    var linkButtonHandler: (() -> ())?

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(avatarImageView)
        contentView.addSubview(postCountLabel)
        contentView.addSubview(postLabel)
        contentView.addSubview(subscribersCountLabel)
        contentView.addSubview(subscribersLabel)
        contentView.addSubview(subscriptionsCountLabel)
        contentView.addSubview(subscriptionsLabel)
        contentView.addSubview(nameProfielLabel)
        contentView.addSubview(professionLabel)
        contentView.addSubview(changeLabel)
        contentView.addSubview(shareProfielLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(buttonWeb)

        makeAvatarImageViewConstraints()
        makePostCountLabelConstraints()
        makePostLabelConstraints()
        makeSubscribersCountLabelConstraints()
        makesubscribersLabelConstraints()
        makeSubscriptionsCountLabelConstraints()
        makeSubscriptionsLabelConstraints()
        makenameProfielLabelConstraints()
        makeprofessionLabelConstraints()
        makeChangeLabelConstraints()
        makeShareProfielLabelConstraints()
        makeIconImageViewConstraints()
        makeButtonWebConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Настройка ячейки профиля
    func setUp(profielInfo: ProfielInfo) {
        avatarImageView.image = UIImage(named: profielInfo.avatarImage)
        postCountLabel.text = profielInfo.countPhoto
        postLabel.text = profielInfo.countPhotoText
        subscribersCountLabel.text = profielInfo.countSubscribers
        subscribersLabel.text = profielInfo.countSubscribersText
        subscriptionsCountLabel.text = profielInfo.countSubscriptions
        subscriptionsLabel.text = profielInfo.countSubscriptionsText
        nameProfielLabel.text = profielInfo.nameProfiel
        professionLabel.text = profielInfo.proffesionProfiel
        changeLabel.text = profielInfo.changeProfiel
        shareProfielLabel.text = profielInfo.shareProfiel
        iconImageView.image = UIImage(named: profielInfo.iconPeople)
        buttonWeb.setTitle(" 📎 www.spacex.com", for: .normal)
    }

    // MARK: - Private Methods

    /// Ограничения для изображения аватара
    private func makeAvatarImageViewConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    /// Ограничения для метки с количеством постов
    private func makePostCountLabelConstraints() {
        postCountLabel.translatesAutoresizingMaskIntoConstraints = false
        postCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 155).isActive = true
        postCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        postCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        postCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    /// Ограничения для метки с подписью к количеству постов
    private func makePostLabelConstraints() {
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 130).isActive = true
        postLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        postLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        postLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    /// Ограничения для метки с количеством подписчиков
    private func makeSubscribersCountLabelConstraints() {
        subscribersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribersCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 225)
            .isActive = true
        subscribersCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        subscribersCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscribersCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    /// Ограничения для метки с подписью к количеству подписчиков
    private func makesubscribersLabelConstraints() {
        subscribersLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribersLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 208).isActive = true
        subscribersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        subscribersLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    /// Ограничения для с количеством подписок
    private func makeSubscriptionsCountLabelConstraints() {
        subscriptionsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionsCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 291)
            .isActive = true
        subscriptionsCountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        subscriptionsCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscriptionsCountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    /// Ограничения для метки с подписью к количеству подписок
    private func makeSubscriptionsLabelConstraints() {
        subscriptionsLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 282).isActive = true
        subscriptionsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        subscriptionsLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscriptionsLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    /// Ограничения для метки с подписью к количеству подписок
    private func makenameProfielLabelConstraints() {
        nameProfielLabel.translatesAutoresizingMaskIntoConstraints = false
        nameProfielLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        nameProfielLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 95).isActive = true
        nameProfielLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        nameProfielLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    /// Ограничения для метки с профессией
    private func makeprofessionLabelConstraints() {
        professionLabel.translatesAutoresizingMaskIntoConstraints = false
        professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        professionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 115).isActive = true
        professionLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        professionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    /// Ограничения для метки с изменением профиля
    private func makeChangeLabelConstraints() {
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        changeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 187).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    /// Ограничения для метки с возможностью поделиться профилем
    private func makeShareProfielLabelConstraints() {
        shareProfielLabel.translatesAutoresizingMaskIntoConstraints = false
        shareProfielLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 175).isActive = true
        shareProfielLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 187).isActive = true
        shareProfielLabel.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareProfielLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    /// Ограничения для изображения иконки
    private func makeIconImageViewConstraints() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 340).isActive = true
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 190).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }

    /// Ограничения для кнопки перехода на веб-сайт
    private func makeButtonWebConstraints() {
        buttonWeb.translatesAutoresizingMaskIntoConstraints = false
        buttonWeb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        buttonWeb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 140).isActive = true
        buttonWeb.widthAnchor.constraint(equalToConstant: 150).isActive = true
        buttonWeb.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonWeb.addTarget(self, action: #selector(openLink), for: .touchUpInside)
    }

    // MARK: - Actions

    /// Отрктые вэб-сайта
    @objc private func openLink() {
        linkButtonHandler?()
    }
}
