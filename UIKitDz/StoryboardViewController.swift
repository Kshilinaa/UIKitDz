// StoryboardViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// создание экрана сториборда со скругленными кругами светофора
final class StoryboardViewController: UIViewController {
    // MARK: - Constants

    let identifier = "StoryboardView"

    // MARK: - IBOutlets

    @IBOutlet var redView: UIView!

    @IBOutlet var yellowView: UIView!

    @IBOutlet var greenView: UIView!

    // MARK: - Initializers

    override func viewDidLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
}
