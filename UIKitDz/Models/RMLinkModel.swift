// RMLinkModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Структура описывающая пост
struct Post {
    /// Картинка профиля
    let avatarName: String
    /// Имя профиля
    let nameTitle: String
    /// Картинка поста
    let postImages: [String]
    /// количество лайков
    let likesCount: String
    /// Подпись под постом
    let postDescription: String
    /// Комментарий
    let commenting: String
    /// Время когда был выложен пост
    let tenMiAgo: String
}

/// Структура, хранящая информацию о рекомендуемых аккаунтах
struct RecomendedAccaounts {
    /// Массив имён аватаров
    let avatarImageName: [String]
    /// Массив имён аккаунтов
    let nameAccount: [String]
}

/// Перечисления  для ресурсов и текста
enum RMConstant {
    static let myStoryImage = "myStoryImage"
    static let lavandaImage = "lavandaImage"
    static let turVDagestanImage = "turVDagestanImage"
    static let turVDagestan1Image = "turVDagestan1Image"
    static let turText = "tur_v_dagestan"
    static let tupPeopleImage = "tupPeopleImage"
    static let maryImage = "maryImage"
    static let crimeImage = "crimeImage"
    static let smallAvatarImage = "smallAvatarImage"
    static let maryName = "mary_pol"
    static let crimeaName = "crimea_082"
    static let likes = "Нравится: 201"
    static let textUnderPost = """
    tur_v_dagestan Насладитесь красотой природы. \
    Забронировать тур в Дагестан можно уже сейчас!
    """
    static let comment = "Комментировать ..."
    static let tenMin = "10 минут назад"
    static let xbutton = "xImage"
    static let rectangleImage = "rectangleImage"
}

/// Структура для хранения ссылок
struct RMLinkStorage {
    /// Для  историй
    let stories = [RMConstant.myStoryImage, RMConstant.lavandaImage]
    /// Для постов
    let posts: [Post] = [.init(
        avatarName: RMConstant.tupPeopleImage,
        nameTitle: RMConstant.turText,
        postImages: [RMConstant.turVDagestanImage, RMConstant.turVDagestan1Image, RMConstant.turVDagestanImage],
        likesCount: RMConstant.likes,
        postDescription: RMConstant.textUnderPost,
        commenting: RMConstant.comment,
        tenMiAgo: RMConstant.tenMin
    )]
    /// Для рекомендованных аккаунтов
    let recomended: [RecomendedAccaounts] = [.init(
        avatarImageName: [RMConstant.crimeImage, RMConstant.maryImage],
        nameAccount: [RMConstant.crimeaName, RMConstant.maryName]
    )]
}
