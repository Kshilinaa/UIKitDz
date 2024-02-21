// RMLinkModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель поста
struct Post {
    let avatarName: String
    let nameTitle: String
    let postImages: [String]
    let likesCount: String
    let postDescription: String
    let commenting: String
    let tenMiAgo: String
}

/// Description
struct RecomendedAccaounts {
    let avatarImageName: [String]
    let nameAccount: [String]
}

/// Descriptio
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

/// Description
struct RMLinkStorage {
    var stories = [RMConstant.myStoryImage, RMConstant.lavandaImage]
    var posts: [Post] = [.init(
        avatarName: RMConstant.tupPeopleImage,
        nameTitle: RMConstant.turText,
        postImages: [RMConstant.turVDagestanImage, RMConstant.turVDagestan1Image, RMConstant.turVDagestanImage],
        likesCount: RMConstant.likes,
        postDescription: RMConstant.textUnderPost,
        commenting: RMConstant.comment,
        tenMiAgo: RMConstant.tenMin
    )]
    var recomended: [RecomendedAccaounts] = [.init(
        avatarImageName: [RMConstant.crimeImage, RMConstant.maryImage],
        nameAccount: [RMConstant.crimeaName, RMConstant.maryName]
    )]
}
