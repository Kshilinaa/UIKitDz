// OtherPostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс для создания и настройки ячейки с остлаьными постами
class OtherPostsCell: UITableViewCell {
    static let identifier = "OtherPostsCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .yellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .yellow
    }

    func setUp(post: Post) {}
}
