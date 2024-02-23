// AllPostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для отображения всех постов в профиле
final class AllPostsCell: UITableViewCell {
    /// Идентификатор ячейки постов
    static let identifier = "PostTileCell"

    var collectionView: UICollectionView!
    var images: [UIImage] = []

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    /// Настройка коллекции
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 124, height: 124)
        layout.minimumLineSpacing = 1.5
        layout.minimumInteritemSpacing = 1.5

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
        contentView.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    // MARK: - Public method

    func setImages(images: [UIImage]) {
        self.images = images
        collectionView.reloadData()
    }
}

// MARK: - Extension UICollectionViewDataSource, UICollectionViewDelegate

/// Расширение для облегчения настройки и управления источником данных и делегатом коллекции
extension AllPostsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    /// Возвращает количество элементов в секции коллекции (картинка * 5)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count * 5
    }

    /// Возвращает ячейку для элемента коллекции по указанному индексу
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)

        let randomIndex = Int.random(in: 0 ..< images.count)
        let image = images[randomIndex]
        let imageView = UIImageView(image: image)

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = cell.contentView.bounds
        cell.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        return cell
    }
}
