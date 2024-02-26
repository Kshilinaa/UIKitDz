// AnchorsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// создание экрана со светофором с помощью анкеров
final class AnchorsViewController: UIViewController {
    // MARK: - Visual Components

    /// Создание зеленой вью
    private let greenView: UIView = {
        let greenView = UIView()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        return greenView
    }()

    /// Создание желтой вью
    private let yellowView: UIView = {
        let yellowView = UIView()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.backgroundColor = .yellow
        return yellowView
    }()

    /// Создание красной вью
    private let redView: UIView = {
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        return redView
    }()

    /// Создание серой вью
    private let grayView: UIView = {
        let grayView = UIView()
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.backgroundColor = .darkGray
        return grayView
    }()

    // MARK: - Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
    }

    override func viewDidLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }

    // MARK: - Private Methods

    private func configureViews() {
        view.addSubview(grayView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        yellowConstraints()
        redConstraints()
        greenConstraints()
        grayConstraints()
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }

    private func yellowConstraints() {
        yellowView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        yellowView.heightAnchor.constraint(lessThanOrEqualToConstant: 110).isActive = true
        let yellowHeight = yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        yellowHeight.priority = .defaultLow
        yellowHeight.isActive = true
    }

    private func redConstraints() {
        redView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -8).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    private func greenConstraints() {
        greenView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 8).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    private func grayConstraints() {
        grayView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -25).isActive = true
        grayView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 25).isActive = true
        grayView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -15).isActive = true
        grayView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 15).isActive = true
    }
}
