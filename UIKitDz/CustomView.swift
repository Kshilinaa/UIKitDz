// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// создание кастомного экрана с скруглением для стэк вью
final class CustomView: UIView {
    // MARK: - Initializers

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
