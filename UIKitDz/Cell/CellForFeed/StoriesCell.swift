// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для создания и настройки ячейки для сторис
final class StoriesCell: UITableViewCell {
    // MARK: - Properties

    /// Перечисление для подписи имя аккаунта под историей
    enum StoryTextConstants {
        static let myStory = "Ваша история"
        static let lavandaStory = "lavanda123"
    }

    static let identifier = "StoriesCell"
    /// ScrollView для отображения сторис
    let scrollView = UIScrollView()
    /// Изображение для текущего пользователя
    let myStoryImage = UIImageView()
    /// Изображение для первой истории
    let firstStoriesimage = UIImageView()
    /// Изображение для второй истории
    let secondStoriesImage = UIImageView()
    /// Изображение для третьей истории
    let thirdStoriesImage = UIImageView()
    /// Изображение для четвертой истории
    let fourthStoriesImage = UIImageView()
    /// Изображение для пятой истории
    let fifthStoriesImage = UIImageView()
    /// Изображение для шестой истории
    let sixthStoriesImage = UIImageView()

    private let myStoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.text = StoryTextConstants.myStory
        return label
    }()

    private let lavandaLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = StoryTextConstants.lavandaStory
        return label
    }()

    private let lavandaLabelTwo: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = StoryTextConstants.lavandaStory
        return label
    }()

    private let lavandaLabelThree: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = StoryTextConstants.lavandaStory
        return label
    }()

    private let lavandaLabelFour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = StoryTextConstants.lavandaStory
        return label
    }()

    private let lavandaLabelFive: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = StoryTextConstants.lavandaStory
        return label
    }()

    private let lavandaLabelSix: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textAlignment = .center
        label.text = StoryTextConstants.lavandaStory
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Setup

    /// Настройка пользовательского интерфейса
    func setupUI() {
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        scrollView.addSubview(firstStoriesimage)
        scrollView.addSubview(myStoryImage)
        scrollView.addSubview(secondStoriesImage)
        scrollView.addSubview(thirdStoriesImage)
        scrollView.addSubview(fourthStoriesImage)
        scrollView.addSubview(fifthStoriesImage)
        scrollView.addSubview(sixthStoriesImage)
        scrollView.addSubview(myStoryLabel)
        scrollView.addSubview(lavandaLabel)
        scrollView.addSubview(lavandaLabelTwo)
        scrollView.addSubview(lavandaLabelThree)
        scrollView.addSubview(lavandaLabelFour)
        scrollView.addSubview(lavandaLabelFive)
        scrollView.addSubview(lavandaLabelSix)
        makeScrollViewConstraints()
        makeImageViewConstraints()
        makeMyStoriesImageViewConstraints()
        makeImageViewConstraints2()
        makeImageViewConstraints3()
        makeImageViewConstraints4()
        makeImageViewConstraints5()
        makeImageViewConstraints6()
        makeMyStoryLabelConstraints()
        makeLavandaLabelConstraints()
        makeLavandaLabelTwoConstraints()
        makeLavandaLabelThreeConstraints()
        makeLavandaLabelFourConstraints()
        makeLavandaLabelFiveConstraints()
        makeLavandaLabelSixConstraints()
    }

    // MARK: - Private Methods

    /// Ограничения для настройки скролл-вью в ячейке
    private func makeScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Ограничения для изображения "Мои сторис"
    private func makeMyStoriesImageViewConstraints() {
        myStoryImage.translatesAutoresizingMaskIntoConstraints = false
        myStoryImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        myStoryImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myStoryImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        myStoryImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    /// Ограничения для первого изображения сторис
    private func makeImageViewConstraints() {
        firstStoriesimage.translatesAutoresizingMaskIntoConstraints = false
        firstStoriesimage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        firstStoriesimage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        firstStoriesimage.leadingAnchor.constraint(equalTo: myStoryImage.trailingAnchor, constant: 22).isActive = true
        firstStoriesimage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    /// Ограничения для второго изображения сторис
    private func makeImageViewConstraints2() {
        secondStoriesImage.translatesAutoresizingMaskIntoConstraints = false
        secondStoriesImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        secondStoriesImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        secondStoriesImage.leadingAnchor.constraint(equalTo: firstStoriesimage.trailingAnchor, constant: 22)
            .isActive = true
        secondStoriesImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    /// Ограничения для третьего изображения сторис
    private func makeImageViewConstraints3() {
        thirdStoriesImage.translatesAutoresizingMaskIntoConstraints = false
        thirdStoriesImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thirdStoriesImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        thirdStoriesImage.leadingAnchor.constraint(equalTo: secondStoriesImage.trailingAnchor, constant: 22)
            .isActive = true
        thirdStoriesImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    /// Ограничения для четвертого изображения сторис
    private func makeImageViewConstraints4() {
        fourthStoriesImage.translatesAutoresizingMaskIntoConstraints = false
        fourthStoriesImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fourthStoriesImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        fourthStoriesImage.leadingAnchor.constraint(equalTo: thirdStoriesImage.trailingAnchor, constant: 22)
            .isActive = true
        fourthStoriesImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    /// Ограничения для пятого изображения сторис
    private func makeImageViewConstraints5() {
        fifthStoriesImage.translatesAutoresizingMaskIntoConstraints = false
        fifthStoriesImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fifthStoriesImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        fifthStoriesImage.leadingAnchor.constraint(equalTo: fourthStoriesImage.trailingAnchor, constant: 22)
            .isActive = true
        fifthStoriesImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    /// Ограничения для шестого изображения сторис
    private func makeImageViewConstraints6() {
        sixthStoriesImage.translatesAutoresizingMaskIntoConstraints = false
        sixthStoriesImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        sixthStoriesImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        sixthStoriesImage.leadingAnchor.constraint(equalTo: fifthStoriesImage.trailingAnchor, constant: 22)
            .isActive = true
        sixthStoriesImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        sixthStoriesImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    /// Ограничения для имени аккаунта моего
    private func makeMyStoryLabelConstraints() {
        myStoryLabel.translatesAutoresizingMaskIntoConstraints = false
        myStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        myStoryLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        myStoryLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 1).isActive = true
        myStoryLabel.topAnchor.constraint(equalTo: myStoryImage.bottomAnchor, constant: 5).isActive = true
    }

    /// Ограничения для имени аккаунта 1-ой истории
    private func makeLavandaLabelConstraints() {
        lavandaLabel.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabel.leadingAnchor.constraint(equalTo: myStoryLabel.trailingAnchor, constant: 5).isActive = true
        lavandaLabel.topAnchor.constraint(equalTo: firstStoriesimage.bottomAnchor, constant: 5).isActive = true
    }

    /// Ограничения для имени аккаунта 2-ой истории
    private func makeLavandaLabelTwoConstraints() {
        lavandaLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelTwo.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelTwo.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelTwo.leadingAnchor.constraint(equalTo: lavandaLabel.trailingAnchor, constant: 5).isActive = true
        lavandaLabelTwo.topAnchor.constraint(equalTo: secondStoriesImage.bottomAnchor, constant: 5).isActive = true
    }

    /// Ограничения для имени аккаунта 3-ой истории
    private func makeLavandaLabelThreeConstraints() {
        lavandaLabelThree.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelThree.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelThree.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelThree.leadingAnchor.constraint(equalTo: lavandaLabelTwo.trailingAnchor, constant: 5).isActive = true
        lavandaLabelThree.topAnchor.constraint(equalTo: thirdStoriesImage.bottomAnchor, constant: 5).isActive = true
    }

    /// Ограничения для имени аккаунта 4-ой истории
    private func makeLavandaLabelFourConstraints() {
        lavandaLabelFour.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelFour.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelFour.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelFour.leadingAnchor.constraint(equalTo: lavandaLabelThree.trailingAnchor, constant: 5)
            .isActive = true
        lavandaLabelFour.topAnchor.constraint(equalTo: fourthStoriesImage.bottomAnchor, constant: 5).isActive = true
    }

    /// Ограничения для имени аккаунта 5-ой истории
    private func makeLavandaLabelFiveConstraints() {
        lavandaLabelFive.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelFive.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelFive.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelFive.leadingAnchor.constraint(equalTo: lavandaLabelFour.trailingAnchor, constant: 5).isActive = true
        lavandaLabelFive.topAnchor.constraint(equalTo: fifthStoriesImage.bottomAnchor, constant: 5).isActive = true
    }

    /// Ограничения для имени аккаунта 6-ой истории
    private func makeLavandaLabelSixConstraints() {
        lavandaLabelSix.translatesAutoresizingMaskIntoConstraints = false
        lavandaLabelSix.widthAnchor.constraint(equalToConstant: 74).isActive = true
        lavandaLabelSix.heightAnchor.constraint(equalToConstant: 10).isActive = true
        lavandaLabelSix.leadingAnchor.constraint(equalTo: lavandaLabelFive.trailingAnchor, constant: 5).isActive = true
        lavandaLabelSix.topAnchor.constraint(equalTo: sixthStoriesImage.bottomAnchor, constant: 5).isActive = true
    }

    // MARK: - Public Methods

    /// Настройка ячейки с данными сторис
    func setupCell(stories: [String]) {
        myStoryImage.image = UIImage(named: stories[0])
        firstStoriesimage.image = UIImage(named: stories[1])
        secondStoriesImage.image = UIImage(named: stories[1])
        thirdStoriesImage.image = UIImage(named: stories[1])
        fourthStoriesImage.image = UIImage(named: stories[1])
        fifthStoriesImage.image = UIImage(named: stories[1])
        sixthStoriesImage.image = UIImage(named: stories[1])
    }
}
