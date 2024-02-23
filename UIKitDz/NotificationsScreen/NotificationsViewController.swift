// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    /// объекты используемые на экране уведомлений
    enum Constants {
        static let firstButtonComment = "lavanda123 понравился ваш комментарий: 'Это где?' 3д."
        static let secondButtonComment = "12miho появился(-ась) в RMLink. Вы можете быть знакомы 3д."
        static let thirdButtonComment = "lavanda123 подписался(-ась) на ваши новости 5д."
        static let fourthButtonComment = "12miho понравился ваш комментарий: 'Ты вернулась?' 7д."
        static let fifthButtonComment = "markS появился(-ась) в RMLink. Вы можете быть знакомы 8д."
        static let sixthButtonComment = "sv_neit появился(-ась) в RMLink. Вы можете быть знакомы 8д."
        static let firstTextComment = "nikolashka228 понравился ваш комментарий: 'Очень красиво!' 12ч"
        static let secondTextComment = "markS упомянул(-а) вас в комментарии: @rm Спасибо! 12ч"
        static let thirdTextComment = "nikolashka228 понравился ваш комментарий: 'Ты вернулась?' 7д."
        static let spaceImage = "thirdPostImage"
        static let girl = "girl"
        static let viewTitleText = "Уведомления"
        static let requestLabelText = "Запросы на подписку"
        static let notificationViewCellIdentifier = "NotificationViewCell"
        static let todayHeader = "Сегодня"
        static let thisWeekHeader = "На этой неделе"
        static let lavandaProfil = "lavandaImage"
        static let racetaImage = "secondPostImage"
        static let kirill = "kirillImage"
        static let nikolashka = "nikolashkaImage"
    }

    /// Виды содержимого на экране уведомлений
    enum ContentType {
        case today
        case thisWeek
    }

    // MARK: - Private properties

    /// Таблица для отображения уведомлений
    private var tableView = UITableView()
    /// Содержимое таблицы
    private var content: [ContentType] = [.today, .thisWeek]
    /// Уведомления на сегодня
    private var todayNotifications: [NotificationModel] = [
        NotificationModel(
            profileImage: Constants.lavandaProfil,
            text: Constants.firstTextComment,
            postImage: Constants.spaceImage,
            isButtonVisible: true
        ),
        NotificationModel(
            profileImage: Constants.girl,
            text: Constants.secondTextComment,
            postImage: Constants.spaceImage,
            isButtonVisible: true
        )
    ]
    /// Уведомления на этой неделе
    private var thisWeeknotifications: [NotificationModel] = [
        NotificationModel(
            profileImage: Constants.nikolashka,
            text: Constants.thirdTextComment,
            postImage: Constants.racetaImage,
            isButtonVisible: true

        ),
        NotificationModel(
            profileImage: Constants.girl,
            text: Constants.firstButtonComment,
            postImage: Constants.spaceImage,
            isButtonVisible: true
        ),

        NotificationModel(
            profileImage: Constants.nikolashka,
            text: Constants.firstTextComment,
            postImage: Constants.spaceImage,
            isButtonVisible: false

        ),
        NotificationModel(
            profileImage: Constants.kirill,
            text: Constants.secondTextComment,
            postImage: Constants.racetaImage,
            isButtonVisible: false
        ),

        NotificationModel(
            profileImage: Constants.nikolashka,
            text: Constants.firstTextComment,
            postImage: Constants.spaceImage,
            isButtonVisible: true

        ),
        NotificationModel(
            profileImage: Constants.kirill,
            text: Constants.fifthButtonComment,
            postImage: Constants.spaceImage,
            isButtonVisible: false
        )
    ]
    /// Текст запросов на подписку
    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.requestLabelText
        label.font = .init(name: "Verdana", size: 12)
        return label
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private methods

    /// Настройка отображения элементов
    private func setup() {
        view.backgroundColor = .white
        createTableView()
        configureNavigationItem()
        addLabelRequests()
        createRefreshControl()
    }

    /// Создание рефреша
    private func createRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(
            self,
            action:
            #selector(handleRefreshControl),
            for: .valueChanged
        )
        tableView.refreshControl?.tintColor = .lightGray
    }

    /// Настройка элемента навигации
    private func configureNavigationItem() {
        let titleView: UILabel = {
            let label = UILabel()
            label.text = Constants.viewTitleText
            label.font = .init(name: "Verdana-Bold", size: 22)
            return label
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }

    /// Создание таблицы
    private func createTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.separatorStyle = .none
        tableView.register(NotificationCell.self, forCellReuseIdentifier: NotificationCell.identifier)
        tableView.register(SubscribeViewCell.self, forCellReuseIdentifier: SubscribeViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    /// Ограничения  для текста запросов на подписку
    private func addLabelRequests() {
        view.addSubview(requestLabel)
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
            .isActive = true
        requestLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        requestLabel.widthAnchor.constraint(equalToConstant: 251).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    /// Обработчик для рефреша
    @objc func handleRefreshControl() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - Extension UITableViewDataSource

/// Расширение для реализации протокола UITableViewDataSource
extension NotificationsViewController: UITableViewDataSource {
    /// Возвращает количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    /// Возвращает количество строк в указанной секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch content[section] {
        case .today:
            return todayNotifications.count
        case .thisWeek:
            return thisWeeknotifications.count
        }
    }

    /// Возвращает ячейку для отображения на указанной позиции
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch content[indexPath.section] {
        case .today:
            let notification = todayNotifications[indexPath.row]
            switch notification.isButtonVisible {
            case true:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NotificationCell.identifier,
                    for: indexPath
                ) as? NotificationCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell

            case false:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SubscribeViewCell.identifier,
                    for: indexPath
                ) as? SubscribeViewCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell
            }

        case .thisWeek:
            let notification = thisWeeknotifications[indexPath.row]
            switch notification.isButtonVisible {
            case true:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: NotificationCell.identifier,
                    for: indexPath
                ) as? NotificationCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell

            case false:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SubscribeViewCell.identifier,
                    for: indexPath
                ) as? SubscribeViewCell else { return UITableViewCell() }
                cell.configure(info: notification)
                return cell
            }
        }
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell
        .EditingStyle { .delete }
    /// Метод для уведомления об изменениях, вызванных пользователем в таблице
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            switch content[indexPath.section] {
            case .today:
                todayNotifications.remove(at: indexPath.row)
            case .thisWeek:
                thisWeeknotifications.remove(at: indexPath.row)
            }
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

// MARK: - Extension UITableViewDelegate

/// Расширение для реализации протокола UITableViewDelegate
extension NotificationsViewController: UITableViewDelegate {
    /// Возвращает представление для заголовка в указанной секции
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))

        let label = UILabel(frame: CGRect(x: 15, y: 10, width: tableView.frame.size.width - 30, height: 30))
        if section == 0 {
            label.text = Constants.todayHeader
        } else if section == 1 {
            label.text = Constants.thisWeekHeader
        }

        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)

        headerView.addSubview(label)

        return headerView
    }

    /// Возвращает высоту заголовка для указанной секции
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}
