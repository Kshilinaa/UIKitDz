// RecommendationsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для создания и настройки ячейки с рекомендациями
final class RecommendationsCell: UITableViewCell {
    // MARK: - Constants

    /// Константы, используемые в ячейке
    enum Constant {
        /// Текст "Рекомендуем вам"
        static let recomend = "Рекомендуем вам"
        /// Текст "Все"
        static let allButton = "Все"
        /// Текст "Подписаться"
        static let subsButton = "Подписаться"
    }

    // MARK: - Public Properties

    /// Идентификатор ячейки
    static let identifier = "RecommendationsCell"

    // MARK: - Private Properties    /// Скролл-вью для содержимого ячейки

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Visual Components

    /// Лейбл  "Рекомендуем вам"
    private let recomendForYouLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.recomend
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()

    /// Кнопка "Все"
    private let allButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle(Constant.allButton, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.textAlignment = .right
        return button
    }()

    /// Прямоугольник использующийся для фона
    private let rectangleImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    /// Картинка крестик
    private let clouseImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    /// Представление аккаунта Крым
    private let accountCrimeaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()

    /// Представление аккаунта Мэри
    private let accountViewMary: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()

    /// Аватарка аккаунта крым
    private let avatarImageViewCrimea: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    /// Аватарка аккаунта Мэри
    private let avatarImageViewMary: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    /// Текст для аккаунта Крым
    private let crimeaNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    /// кнопка крестик у аккаунта Крым
    private let xCrimeaButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xImage"), for: .normal)
        return button
    }()

    /// кнопка крестик у аккаунта Мэри
    private let xMaryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xImage"), for: .normal)
        return button
    }()

    /// Текст для аккаунта Мэри
    private let maryNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()

    /// Кнопка подписаться у аккаунта Крым
    private let subscribeCrimeaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle(Constant.subsButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        return button
    }()

    /// Кнопка подписаться у аккаунта Мэри
    private let subscribeMaryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle(Constant.subsButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(named: "newBackgroandColor")
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: -

    /// Настройка пользовательского интерфейса
    func setupUI() {
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        scrollView.addSubview(recomendForYouLabel)
        scrollView.addSubview(allButton)
        scrollView.addSubview(accountCrimeaImageView)
        scrollView.addSubview(accountViewMary)
        accountViewMary.addSubview(xMaryButton)
        accountCrimeaImageView.addSubview(xCrimeaButton)
        accountCrimeaImageView.addSubview(avatarImageViewCrimea)
        accountViewMary.addSubview(avatarImageViewMary)
        accountCrimeaImageView.addSubview(subscribeCrimeaButton)
        accountViewMary.addSubview(subscribeMaryButton)
        accountViewMary.addSubview(maryNameLabel)
        accountCrimeaImageView.addSubview(crimeaNameLabel)
        makeScrollViewConstraints()
        makeAllButtonConstraints()
        makeRecomendLabelConstraints()
        makeAccountViewCrimeaConstraints()
        makeAccountViewMaryConstraints()
        makeAccountViewMaryConstraints()
        makeXCrimeaButtonConstraints()
        makeXMaryButtonConstraints()
        makeAvatarImageViewCrimeaConstraints()
        makeAvatarImageViewMaryConstraints()
        makeSubscribeCrimeaButtonConstraints()
        makeSubscribeMaryButtonConstraints()
        makeMaryNameLabelConstraints()
        makeCrimeaNameLabelConstraints()
    }

    // MARK: - Private Methods

    /// Oграничения для scrollView
    private func makeScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        scrollView.backgroundColor = .none
    }

    /// Oграничения для метки "Рекомендуем вам"
    private func makeRecomendLabelConstraints() {
        recomendForYouLabel.translatesAutoresizingMaskIntoConstraints = false
        recomendForYouLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12)
            .isActive = true
        recomendForYouLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 9).isActive = true
        recomendForYouLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        recomendForYouLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    /// Oграничения для кнопки "Все"
    private func makeAllButtonConstraints() {
        allButton.translatesAutoresizingMaskIntoConstraints = false
        allButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10)
            .isActive = true
        allButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 9).isActive = true
        allButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        allButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    /// Oграничения для представления аккаунта Крым
    private func makeAccountViewCrimeaConstraints() {
        accountCrimeaImageView.translatesAutoresizingMaskIntoConstraints = false
        accountCrimeaImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 17)
            .isActive = true
        accountCrimeaImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
        accountCrimeaImageView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        accountCrimeaImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    /// Oраничения для представления аккаунта Мэри
    private func makeAccountViewMaryConstraints() {
        accountViewMary.translatesAutoresizingMaskIntoConstraints = false
        accountViewMary.leadingAnchor.constraint(equalTo: accountCrimeaImageView.trailingAnchor, constant: 20)
            .isActive = true
        accountViewMary.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -17)
            .isActive = true
        accountViewMary.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true
        accountViewMary.widthAnchor.constraint(equalToConstant: 185).isActive = true
        accountViewMary.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    /// ограничения для метки имени аккаунта Мэри
    private func makeMaryNameLabelConstraints() {
        maryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        maryNameLabel.leadingAnchor.constraint(equalTo: accountViewMary.leadingAnchor, constant: 42)
            .isActive = true
        maryNameLabel.topAnchor.constraint(equalTo: avatarImageViewMary.bottomAnchor, constant: 5).isActive = true
        maryNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        maryNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    // Ограничения для метки имени аккаунта "Крым"
    private func makeCrimeaNameLabelConstraints() {
        crimeaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        crimeaNameLabel.leadingAnchor.constraint(equalTo: accountCrimeaImageView.leadingAnchor, constant: 42)
            .isActive = true
        crimeaNameLabel.topAnchor.constraint(equalTo: avatarImageViewCrimea.bottomAnchor, constant: 5)
            .isActive = true
        crimeaNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        crimeaNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    /// ограничений для кнопки X аккаунта Крым
    private func makeXCrimeaButtonConstraints() {
        xCrimeaButton.translatesAutoresizingMaskIntoConstraints = false
        xCrimeaButton.trailingAnchor.constraint(equalTo: accountCrimeaImageView.trailingAnchor, constant: -8)
            .isActive = true
        xCrimeaButton.topAnchor.constraint(equalTo: accountCrimeaImageView.topAnchor, constant: 8).isActive = true
        xCrimeaButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        xCrimeaButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
    }

    /// ограничений для кнопки X аккаунта Мэри
    private func makeXMaryButtonConstraints() {
        xMaryButton.translatesAutoresizingMaskIntoConstraints = false
        xMaryButton.trailingAnchor.constraint(equalTo: accountViewMary.trailingAnchor, constant: -8)
            .isActive = true
        xMaryButton.topAnchor.constraint(equalTo: accountViewMary.topAnchor, constant: 8).isActive = true
        xMaryButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        xMaryButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
    }

    /// Ограничения для изображения аватара аккаунта Крым
    private func makeAvatarImageViewCrimeaConstraints() {
        avatarImageViewCrimea.translatesAutoresizingMaskIntoConstraints = false
        avatarImageViewCrimea.leadingAnchor.constraint(equalTo: accountCrimeaImageView.leadingAnchor, constant: 35)
            .isActive = true
        avatarImageViewCrimea.topAnchor.constraint(equalTo: accountCrimeaImageView.topAnchor, constant: 15)
            .isActive = true
        avatarImageViewCrimea.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarImageViewCrimea.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    /// Ограничения для изображения аватара аккаунта Мэри
    private func makeAvatarImageViewMaryConstraints() {
        avatarImageViewMary.translatesAutoresizingMaskIntoConstraints = false
        avatarImageViewMary.leadingAnchor.constraint(equalTo: accountViewMary.leadingAnchor, constant: 35)
            .isActive = true
        avatarImageViewMary.topAnchor.constraint(equalTo: accountViewMary.topAnchor, constant: 15).isActive = true
        avatarImageViewMary.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarImageViewMary.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    /// Ограничений для кнопки "Подписаться" аккаунта Крым
    private func makeSubscribeCrimeaButtonConstraints() {
        subscribeCrimeaButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeCrimeaButton.leadingAnchor.constraint(equalTo: accountCrimeaImageView.leadingAnchor, constant: 10)
            .isActive = true
        subscribeCrimeaButton.bottomAnchor.constraint(equalTo: accountCrimeaImageView.bottomAnchor, constant: -9)
            .isActive = true
        subscribeCrimeaButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeCrimeaButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    /// Ограничений для кнопки "Подписаться" аккаунта Мэри
    private func makeSubscribeMaryButtonConstraints() {
        subscribeMaryButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeMaryButton.leadingAnchor.constraint(equalTo: accountViewMary.leadingAnchor, constant: 10)
            .isActive = true
        subscribeMaryButton.bottomAnchor.constraint(equalTo: accountViewMary.bottomAnchor, constant: -9)
            .isActive = true
        subscribeMaryButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeMaryButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    // MARK: - Public Methods

    /// Настройка пользовательского интерфейса для ячейки с рекомендациями
    func setupRec(recomend: RecomendedAccaounts) {
        avatarImageViewCrimea.image = UIImage(named: recomend.avatarImageName[0])
        avatarImageViewMary.image = UIImage(named: recomend.avatarImageName[1])
        crimeaNameLabel.text = recomend.nameAccount[0]
        maryNameLabel.text = recomend.nameAccount[1]
    }
}
