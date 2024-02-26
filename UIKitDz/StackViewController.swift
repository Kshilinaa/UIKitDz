// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

//
//  StackViewController.swift
//  UIKitDz
//
//  Created by Ксения Шилина on 25.02.2024.
//

import UIKit

/// создание экрана с помощью стэк вью
final class StackViewController: UIViewController {
    // MARK: - Visual Components

    private let greenView: CustomView = {
        let greenView = CustomView()
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        return greenView
    }()

    private let yellowView: CustomView = {
        let yellowView = CustomView()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.backgroundColor = .yellow
        return yellowView
    }()

    private let redView: CustomView = {
        let redView = CustomView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = .red
        return redView
    }()

    private let grayView: UIView = {
        let grayView = UIView()
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.backgroundColor = .darkGray
        return grayView
    }()

    private var stackView = UIStackView()

    // MARK: - Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackView()
        constraintStackView()
        constraintGrayView()
    }

    override func viewDidLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }

    // MARK: - Private Methods

    private func setupStackView() {
        view.addSubview(grayView)
        stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
    }

    private func constraintStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 376).isActive = true
        let stackHeight = stackView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0.8)
        stackHeight.priority = .defaultLow
        stackHeight.isActive = true
        stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.33).isActive = true
    }

    private func constraintGrayView() {
        grayView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        grayView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        grayView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 25).isActive = true
        grayView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 25).isActive = true
    }
}
