// ModelsForProfiel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Структура, описывающая информацию профиля
struct ProfielInfo {
    /// Изображение аватара
    let avatarImage: String
    /// Количество фотографий
    let countPhoto: String
    /// Текст для количества фотографий
    let countPhotoText: String
    /// Количество подписчиков
    let countSubscribers: String
    /// Текст для количества подписчиков
    let countSubscribersText: String
    /// Количество подписок
    let countSubscriptions: String
    /// Текст для количества подписок
    let countSubscriptionsText: String
    /// Имя профиля
    let nameProfiel: String
    /// Профессия профиля
    let proffesionProfiel: String
    /// Текст изменений профиля
    let changeProfiel: String
    /// Текст поделиться профилем
    let shareProfiel: String
    /// Иконка людей
    let iconPeople: String
}

/// Константы, связанные с профилем
enum ProfielConstant {
    static let avatar = "myStoryImage"
    static let countPhotos = "67"
    static let countSubsc = "458"
    static let countPeople = "120"
    static let countPhotosText = "публикации"
    static let countSubscText = "подписчики"
    static let countPeopleText = "подписки"
    static let nameprofiel = "Мария Иванова"
    static let professionAcc = "Консультант"
    static let shareProfielText = "Поделиться профилем"
    static let changeProfielText = "Изменить"
    static let iconPeoples = "IconImage"
    static let launch = "launchImage"
    static let moon = "moonImage"
    static let astronaut = "actronavtImage1"
    static let space = "spaceImage"
    static let firstPost = "firstPostImage"
    static let secondPost = "secondPostImage"
    static let thirdPost = "thirdPostImage"
}

/// Структура, хранящая информацию профиля
struct ProfielStorage {
    /// Информация о профиле
    let profielInfo: [ProfielInfo] = [
        .init(
            avatarImage: ProfielConstant.avatar,
            countPhoto: ProfielConstant.countPhotos,
            countPhotoText: ProfielConstant.countPhotosText,
            countSubscribers: ProfielConstant.countSubsc,
            countSubscribersText: ProfielConstant.countSubscText,
            countSubscriptions: ProfielConstant.countPeople,
            countSubscriptionsText: ProfielConstant.countPeopleText,
            nameProfiel: ProfielConstant.nameprofiel,
            proffesionProfiel: ProfielConstant.professionAcc,
            changeProfiel: ProfielConstant.changeProfielText,
            shareProfiel: ProfielConstant.shareProfielText,
            iconPeople: ProfielConstant.iconPeoples
        )
    ]
    /// Актуальные истории
    let currentStory = [ProfielConstant.launch, ProfielConstant.moon, ProfielConstant.astronaut, ProfielConstant.space]
}
