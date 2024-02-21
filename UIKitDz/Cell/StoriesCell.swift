// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для создания и настройки ячейки для сторис
class StoriesCell: UITableViewCell {
    static let identifier = "StoriesCell"

    let scrollView = UIScrollView()
    let myStory = UIImageView()
    let imageStories = UIImageView()
    let imageStories2 = UIImageView()
    let imageStories3 = UIImageView()
    let imageStories4 = UIImageView()
    let imageStories5 = UIImageView()
    let imageStories6 = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        scrollView.showsHorizontalScrollIndicator = false
        contentView.addSubview(scrollView)
        scrollView.addSubview(imageStories)
        scrollView.addSubview(myStory)
        scrollView.addSubview(imageStories2)
        scrollView.addSubview(imageStories3)
        scrollView.addSubview(imageStories4)
        scrollView.addSubview(imageStories5)
        scrollView.addSubview(imageStories6)

        makeScrollViewConstraints()
        makeImageViewConstraints()
        makeMyStoriesImageViewConstraints()
        makeImageViewConstraints2()
        makeImageViewConstraints3()
        makeImageViewConstraints4()
        makeImageViewConstraints5()
        makeImageViewConstraints6()
    }

    private func makeScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func makeMyStoriesImageViewConstraints() {
        myStory.translatesAutoresizingMaskIntoConstraints = false
        myStory.widthAnchor.constraint(equalToConstant: 60).isActive = true
        myStory.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myStory.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        myStory.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageViewConstraints() {
        imageStories.translatesAutoresizingMaskIntoConstraints = false
        imageStories.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories.leadingAnchor.constraint(equalTo: myStory.trailingAnchor, constant: 22).isActive = true
        imageStories.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageViewConstraints2() {
        imageStories2.translatesAutoresizingMaskIntoConstraints = false
        imageStories2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories2.leadingAnchor.constraint(equalTo: imageStories.trailingAnchor, constant: 22).isActive = true
        imageStories2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageViewConstraints3() {
        imageStories3.translatesAutoresizingMaskIntoConstraints = false
        imageStories3.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories3.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories3.leadingAnchor.constraint(equalTo: imageStories2.trailingAnchor, constant: 22).isActive = true
        imageStories3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageViewConstraints4() {
        imageStories4.translatesAutoresizingMaskIntoConstraints = false
        imageStories4.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories4.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories4.leadingAnchor.constraint(equalTo: imageStories3.trailingAnchor, constant: 22).isActive = true
        imageStories4.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageViewConstraints5() {
        imageStories5.translatesAutoresizingMaskIntoConstraints = false
        imageStories5.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories5.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories5.leadingAnchor.constraint(equalTo: imageStories4.trailingAnchor, constant: 22).isActive = true
        imageStories5.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    private func makeImageViewConstraints6() {
        imageStories6.translatesAutoresizingMaskIntoConstraints = false
        imageStories6.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories6.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageStories6.leadingAnchor.constraint(equalTo: imageStories5.trailingAnchor, constant: 22).isActive = true
        imageStories6.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        imageStories6.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
    }

    func setupCell(stories: [String]) {
        myStory.image = UIImage(named: stories[0])
        imageStories.image = UIImage(named: stories[1])
        imageStories2.image = UIImage(named: stories[1])
        imageStories3.image = UIImage(named: stories[1])
        imageStories4.image = UIImage(named: stories[1])
        imageStories5.image = UIImage(named: stories[1])
        imageStories6.image = UIImage(named: stories[1])
    }
}
