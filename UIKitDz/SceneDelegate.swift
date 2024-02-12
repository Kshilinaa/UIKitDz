// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SceneDelegate Class
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let loginVC = RegisterViewController()
        let navigationVC = UINavigationController()

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationVC
        navigationVC.pushViewController(loginVC, animated: true)
        window.makeKeyAndVisible()
        self.window = window
        window.backgroundColor = .white
    }
}
