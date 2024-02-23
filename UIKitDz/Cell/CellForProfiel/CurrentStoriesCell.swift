// CurrentStoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка  для актуальных историй
final class CurrentStoriesCell: UITableViewCell {
    // MARK: - Constants

    /// Идентификатор ячейки историй
    static let identifier = "CurrentStoriesCell"
    let scrollView = UIScrollView()
    let firstCurrent = UIButton(type: .custom)
    let secondCurrent = UIImageView()
    let thirdCurrent = UIImageView()
    let fourthCurrent = UIImageView()
    let fifthCurrent = UIImageView()
    let sixthCurrent = UIImageView()
    let seventhCurrent = UIImageView()
    let rocketButton = UIButton(type: .custom)

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

    /// Настройка пользовательского интерфейса
    private func setupUI() {
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        scrollView.addSubview(firstCurrent)
        scrollView.addSubview(secondCurrent)
        scrollView.addSubview(thirdCurrent)
        scrollView.addSubview(fourthCurrent)
        scrollView.addSubview(fifthCurrent)
        scrollView.addSubview(sixthCurrent)
        scrollView.addSubview(seventhCurrent)
        makeScrollViewConstraints()
        makeCurrentStoriesConstraints()
        makeCurrentTwoStoriesConstraints()
        makeCurrentTreeStoriesConstraints()
        makeCurrentFourStoriesConstraints()
        makeCurrentFiveStoriesConstraints()
        makeCurrentSixStoriesConstraints()
        makeCurrentSevenStoriesConstraints()
    }

    // MARK: - Private methods

    /// Ограничения для scrollView
    private func makeScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Ограничения для первой истории
    private func makeCurrentStoriesConstraints() {
        firstCurrent.translatesAutoresizingMaskIntoConstraints = false
        firstCurrent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        firstCurrent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        firstCurrent.widthAnchor.constraint(equalToConstant: 55).isActive = true
        firstCurrent.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    /// Ограничения для второй истории
    private func makeCurrentTwoStoriesConstraints() {
        secondCurrent.translatesAutoresizingMaskIntoConstraints = false
        secondCurrent.leadingAnchor.constraint(equalTo: firstCurrent.trailingAnchor, constant: 10)
            .isActive = true
        secondCurrent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        secondCurrent.widthAnchor.constraint(equalToConstant: 55).isActive = true
        secondCurrent.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    /// Ограничения для третьей истории
    private func makeCurrentTreeStoriesConstraints() {
        thirdCurrent.translatesAutoresizingMaskIntoConstraints = false
        thirdCurrent.leadingAnchor.constraint(equalTo: secondCurrent.leadingAnchor, constant: 62).isActive = true
        thirdCurrent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        thirdCurrent.widthAnchor.constraint(equalToConstant: 55).isActive = true
        thirdCurrent.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    /// Ограничения для четвертой истории
    private func makeCurrentFourStoriesConstraints() {
        fourthCurrent.translatesAutoresizingMaskIntoConstraints = false
        fourthCurrent.leadingAnchor.constraint(equalTo: thirdCurrent.leadingAnchor, constant: 62).isActive = true
        fourthCurrent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        fourthCurrent.widthAnchor.constraint(equalToConstant: 55).isActive = true
        fourthCurrent.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    /// Ограничения для пятой истории
    private func makeCurrentFiveStoriesConstraints() {
        fifthCurrent.translatesAutoresizingMaskIntoConstraints = false
        fifthCurrent.leadingAnchor.constraint(equalTo: fourthCurrent.leadingAnchor, constant: 62).isActive = true
        fifthCurrent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        fifthCurrent.widthAnchor.constraint(equalToConstant: 55).isActive = true
        fifthCurrent.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    /// Ограничения для шестой истории
    private func makeCurrentSixStoriesConstraints() {
        sixthCurrent.translatesAutoresizingMaskIntoConstraints = false
        sixthCurrent.leadingAnchor.constraint(equalTo: fifthCurrent.leadingAnchor, constant: 62).isActive = true
        sixthCurrent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        sixthCurrent.widthAnchor.constraint(equalToConstant: 55).isActive = true
        sixthCurrent.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }

    /// Ограничения для седьмой истории
    private func makeCurrentSevenStoriesConstraints() {
        seventhCurrent.translatesAutoresizingMaskIntoConstraints = false
        seventhCurrent.leadingAnchor.constraint(equalTo: sixthCurrent.leadingAnchor, constant: 62).isActive = true
        seventhCurrent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        seventhCurrent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        seventhCurrent.widthAnchor.constraint(equalToConstant: 55).isActive = true
        seventhCurrent.heightAnchor.constraint(equalToConstant: 71).isActive = true
        seventhCurrent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -7).isActive = true
    }

    // MARK: - public methods

    /// Настройка ячейки с текущими историями
    func setUpCell(currentStory: [String]) {
        firstCurrent.setImage(UIImage(named: currentStory[0]), for: .normal)
        secondCurrent.image = UIImage(named: currentStory[1])
        thirdCurrent.image = UIImage(named: currentStory[2])
        fourthCurrent.image = UIImage(named: currentStory[3])
        fifthCurrent.image = UIImage(named: currentStory[0])
        sixthCurrent.image = UIImage(named: currentStory[1])
        seventhCurrent.image = UIImage(named: currentStory[2])
    }
}
