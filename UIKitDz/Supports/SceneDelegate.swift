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
        tabBarBorder.backgroundColor = .lightGray
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
    }
}
