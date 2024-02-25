// ProfielViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для создания профиля
final class ProfielViewController: UIViewController {
    // MARK: - Constants

    /// Перечисление, определяющее типы ячеек в таблице
    enum CountCells {
        /// для информации профиля
        case profiel
        /// для закрепленных историй
        case currentStories
        /// для постов
        case allPosts
    }

    let profielStorage = ProfielStorage()
    let refreshControl = UIRefreshControl()
    let tableView = UITableView()
    let range: [CountCells] = [.profiel, .currentStories, .allPosts]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupRefreshControll()
    }

    // MARK: - Public method

    /// Настройка таблицы
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.register(ProfielCell.self, forCellReuseIdentifier: ProfielCell.identifier)
        tableView.register(CurrentStoriesCell.self, forCellReuseIdentifier: CurrentStoriesCell.identifier)
        tableView.register(AllPostsCell.self, forCellReuseIdentifier: AllPostsCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    /// Настройка обновление
    func setupRefreshControll() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    /// Обновление данных
    @objc func refreshData() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}

// MARK: - Extension ProfielViewController: UITableViewDataSource

extension ProfielViewController: UITableViewDataSource {
    /// Количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    /// Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    /// Создание и настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = range[indexPath.section]
        switch cells {
        case .profiel:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfielCell.identifier,
                for: indexPath
            ) as? ProfielCell else {
                return UITableViewCell()
            }
            cell.setUp(profielInfo: ProfielInfo(
                avatarImage: ProfielConstant.avatar,
                countPhoto: ProfielConstant.countPhotos,
                countPhotoText: ProfielConstant.countPhotosText,
                countSubscribers: ProfielConstant.countSubsc,
                countSubscribersText: ProfielConstant.countSubscText,
                countSubscriptions: ProfielConstant.countPeople,
                countSubscriptionsText: ProfielConstant.countPeopleText,
                nameProfiel: ProfielConstant.nameprofiel,
                proffesionProfiel: ProfielConstant.professionAcc,
                changeProfiel: ProfielConstant.changeProfielText,
                shareProfiel: ProfielConstant.shareProfielText,
                iconPeople: ProfielConstant.iconPeoples
            ))
            cell.linkButtonHandler = { [weak self] in
                let controllerToMove = WebPresentViewController()
                self?.present(controllerToMove, animated: true)
            }
            return cell
        case .currentStories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CurrentStoriesCell.identifier,
                for: indexPath
            ) as? CurrentStoriesCell else { return UITableViewCell() }
            cell.setUpCell(currentStory: profielStorage.currentStory)
            return cell
        case .allPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AllPostsCell.identifier,
                for: indexPath
            ) as? AllPostsCell else {
                return UITableViewCell()
            }
            guard let firstImage = UIImage(named: ProfielConstant.firstPost),
                  let secondImage = UIImage(named: ProfielConstant.secondPost),
                  let thirdImage = UIImage(named: ProfielConstant.thirdPost)
            else {
                return cell
            }

            cell.setImages(images: [firstImage, secondImage, thirdImage])
            return cell
        }
    }
}

// MARK: - Extension UITableViewDelegate

/// Расширение для облегчения работы с таблицей
extension ProfielViewController: UITableViewDelegate {
    /// Устанавливает высоту каждой строки в зависимости от типа содержимого ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = range[indexPath.section]
        switch cellType {
        case .profiel:
            return 220
        case .currentStories:
            return 90
        case .allPosts:
            return 400
        }
    }
}
