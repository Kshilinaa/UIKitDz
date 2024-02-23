// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SceneDelegate Class
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let viewController = ViewController()
        let notificationsController = NotificationsViewController()
        let profielConrtroller = ProfielViewController()

        // навигация

        let viewNavigetionController = UINavigationController(rootViewController: viewController)
        let notificationsNavigatetionController =
            UINavigationController(rootViewController: notificationsController)
        let profielNavigetionController = UINavigationController(rootViewController: profielConrtroller)

        viewNavigetionController.navigationBar.barTintColor = UIColor.black

        tabBarController.setViewControllers(
            [viewNavigetionController, notificationsNavigatetionController, profielNavigetionController],
            animated: true
        )

        viewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(named: "homeImage"), tag: 0)
        notificationsController.tabBarItem = UITabBarItem(
            title: "Уведомления",
            image: UIImage(named: "notificationImage"),
            tag: 1
        )
        profielConrtroller.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profielImage"),
            tag: 2
        )

        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = UIColor(named: "blueCastom")

        let tabBarBorder = UIView(frame: CGRect(
            x: 0,
            y: -1,
            width: tabBarController.tabBar.frame.width,
            height: 1
        ))
        tabBarBorder.backgroundColor = .white
        tabBarController.tabBar.addSubview(tabBarBorder)

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        // Настройка навигационных элементов только для ViewController
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "chatImage")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )

        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "RMLinkImage")?.withRenderingMode(.alwaysOriginal),
            style: .done,
            target: self,
            action: nil
        )

        let leftCustomView = UIView()
        let leftImageView = UIImageView(image: UIImage(named: "lockImage"))
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftCustomView.addSubview(leftImageView)

        let leftLabel = UILabel()
        leftLabel.text = "mary_rmLink"
        leftLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        leftLabel.textColor = .black
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftCustomView.addSubview(leftLabel)

        // Анкоры для UIImageView слева
        leftImageView.leadingAnchor.constraint(equalTo: leftCustomView.leadingAnchor).isActive = true
        leftImageView.centerYAnchor.constraint(equalTo: leftCustomView.centerYAnchor).isActive = true
        leftImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        leftImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        // Анкоры для UILabel слева
        leftLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 4).isActive = true
        leftLabel.centerYAnchor.constraint(equalTo: leftCustomView.centerYAnchor).isActive = true

        leftCustomView.frame = CGRect(x: 0, y: 0, width: 120, height: 44)

        let leftCustomBarButtonItem = UIBarButtonItem(customView: leftCustomView)

        // Используйте profielNavigetionController вместо notificationsController
        profielConrtroller.navigationItem.leftBarButtonItem = leftCustomBarButtonItem

        // Для навигационной панели справа
        let rightCustomView = UIView()

        let treeLineImageView = UIImageView(image: UIImage(named: "treeLineImage"))
        treeLineImageView.translatesAutoresizingMaskIntoConstraints = false
        rightCustomView.addSubview(treeLineImageView)

        let plusImageView = UIImageView(image: UIImage(named: "plusImage"))
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        rightCustomView.addSubview(plusImageView)

        // Анкоры для treeLineImage
        treeLineImageView.trailingAnchor.constraint(equalTo: plusImageView.leadingAnchor, constant: -4).isActive = true
        treeLineImageView.centerYAnchor.constraint(equalTo: rightCustomView.centerYAnchor).isActive = true
        treeLineImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        treeLineImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true

        // Анкоры для plusImage
        plusImageView.trailingAnchor.constraint(equalTo: rightCustomView.trailingAnchor).isActive = true
        plusImageView.centerYAnchor.constraint(equalTo: rightCustomView.centerYAnchor).isActive = true
        plusImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        plusImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true

        rightCustomView.frame = CGRect(x: 0, y: 0, width: 120, height: 44)

        let rightCustomBarButtonItem = UIBarButtonItem(customView: rightCustomView)

        // Используйте profielNavigetionController вместо notificationsController
        profielConrtroller.navigationItem.rightBarButtonItem = rightCustomBarButtonItem
    }
}
