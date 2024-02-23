// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Лента
final class ViewController: UIViewController {
    /// Типы серий ячеек
    enum CountSeries {
        /// Для историй
        case stories
        /// Для первого посто
        case firstPost
        /// Для рекомендаций
        case recommendationns
        /// Для остальных постов
        case otherPosts
    }

    let rmLinkStorage = RMLinkStorage()
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    /// Список рядов ячеек
    let series: [CountSeries] = [
        .stories,
        .firstPost,
        .recommendationns,
        .otherPosts
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupRefreshControll()
    }

    // MARK: - Setup Methods

    /// Настройка таблицы.
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.identifier)
        tableView.register(FirstPostCell.self, forCellReuseIdentifier: FirstPostCell.identifier)
        tableView.register(RecommendationsCell.self, forCellReuseIdentifier: RecommendationsCell.identifier)
        tableView.register(OtherPostsCell.self, forCellReuseIdentifier: OtherPostsCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    /// Настройка рефреша
    func setupRefreshControll() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    // MARK: - Action Methods

    /// Метод обновления
    @objc func refreshData() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

/// Расширение  для упрощения реализации протокола, облегчает работу с отображением данных в таблице
extension ViewController: UITableViewDataSource {
    /// Определяет количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        series.count
    }

    /// Определяет количество строк в указанной секции таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellsType = series[section]
        switch cellsType {
        case .stories, .firstPost, .recommendationns:
            return 1
        case .otherPosts:
            return rmLinkStorage.posts.count
        }
    }

    /// Определяет ячейку для отображения в указанной позиции таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = series[indexPath.section]
        switch cells {
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: StoriesCell.identifier, for: indexPath) as? StoriesCell
            else { return UITableViewCell() }
            cell.setupCell(stories: rmLinkStorage.stories)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FirstPostCell.identifier,
                for: indexPath
            ) as? FirstPostCell else { return UITableViewCell() }
            cell.setUp(posts: Post(
                avatarName: RMConstant.tupPeopleImage,
                nameTitle: RMConstant.turText,
                postImages: [
                    RMConstant.turVDagestanImage,
                    RMConstant.turVDagestan1Image,
                    RMConstant.turVDagestanImage
                ],
                likesCount: RMConstant.likes,
                postDescription: RMConstant.textUnderPost,
                commenting: RMConstant.comment,
                tenMiAgo: RMConstant.tenMin
            ))
            return cell
        case .recommendationns:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendationsCell.identifier,
                for: indexPath
            ) as? RecommendationsCell else { return UITableViewCell() }
            cell.setupRec(recomend: RecomendedAccaounts(
                avatarImageName: [RMConstant.crimeImage, RMConstant.maryImage],
                nameAccount: [RMConstant.crimeaName, RMConstant.maryName]
            ))
            return cell
        case .otherPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: OtherPostsCell.identifier,
                for: indexPath
            ) as? OtherPostsCell else { return UITableViewCell() }
            cell.setUp(posts: rmLinkStorage.posts[indexPath.row])
            return cell
        }
    }
}

// MARK: - Extension UITableViewDelegate

extension ViewController: UITableViewDelegate {
    /// Определяет высоту ячейки для указанной позиции в таблице
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = series[indexPath.section]
        switch cellType {
        case .stories:
            return 90
        case .firstPost:
            return 440
        case .recommendationns:
            return 280
        case .otherPosts:
            return 600
        }
    }
}
