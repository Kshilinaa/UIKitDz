// BirthdaysList.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс с днями рождениями
class BirthdaysList: UIViewController {
    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = "Birthday Reminder"
        // кнопка "Добавить" на панели навигации
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSettings))
        navigationItem.rightBarButtonItem = addBarButton

        peopleInfo()
    }

    // MARK: - Private Methods

    // Helena
    private let helenaLink: UILabel = {
        let linkHelena = UILabel()
        linkHelena.text = "Helena Link"
        linkHelena.font = UIFont(name: "Verdana-bold", size: 16)
        linkHelena.frame = CGRect(x: 100, y: 135, width: 209, height: 20)
        return linkHelena
    }()

    private let helenaPhoto: UIImageView = {
        let helenImage = UIImageView()
        helenImage.image = UIImage(named: "helenImage")
        helenImage.frame = CGRect(x: 20, y: 120, width: 75, height: 75)
        return helenImage
    }()

    private let cakeForHelen: UIImageView = {
        let cakeImage = UIImageView()
        cakeImage.image = UIImage(named: "cakeImage")
        cakeImage.frame = CGRect(x: 330, y: 135, width: 44, height: 44)
        return cakeImage
    }()

    private let bdHelen: UILabel = {
        let helenBirthday = UILabel()
        helenBirthday.text = "10.03 - turns 251"
        helenBirthday.font = UIFont(name: "Verdana", size: 14)
        helenBirthday.frame = CGRect(x: 100, y: 160, width: 209, height: 20)
        return helenBirthday
    }()

    // Verona
    private let veronaLink: UILabel = {
        let linkVerona = UILabel()
        linkVerona.text = "Verona Tusk"
        linkVerona.font = UIFont(name: "Verdana-bold", size: 16)
        linkVerona.frame = CGRect(x: 100, y: 225, width: 209, height: 20)
        return linkVerona
    }()

    private let veronaPhoto: UIImageView = {
        let veronaImage = UIImageView()
        veronaImage.image = UIImage(named: "veronaImage")
        veronaImage.frame = CGRect(x: 20, y: 210, width: 75, height: 75)
        return veronaImage
    }()

    private let bdVerona: UILabel = {
        let veronaBD = UILabel()
        veronaBD.text = "20.03 - turns 39"
        veronaBD.font = UIFont(name: "Verdana", size: 14)
        veronaBD.frame = CGRect(x: 100, y: 250, width: 209, height: 20)
        return veronaBD
    }()

    private let veronaDay: UIImageView = {
        let dayVerona = UIImageView()
        dayVerona.image = UIImage(named: "days10Image")
        dayVerona.frame = CGRect(x: 330, y: 225, width: 42, height: 42)
        return dayVerona
    }()

    // Alex
    private let alexLink: UILabel = {
        let linkAlex = UILabel()
        linkAlex.text = "Alex Smith"
        linkAlex.font = UIFont(name: "Verdana-bold", size: 16)
        linkAlex.frame = CGRect(x: 100, y: 315, width: 209, height: 20)
        return linkAlex
    }()

    private let alexPhoto: UIImageView = {
        let alexImage = UIImageView()
        alexImage.image = UIImage(named: "alexImage")
        alexImage.frame = CGRect(x: 20, y: 305, width: 75, height: 75)
        return alexImage
    }()

    private let alexDays: UIImageView = {
        let daysAlex = UIImageView()
        daysAlex.image = UIImage(named: "days42Image")
        daysAlex.frame = CGRect(x: 330, y: 315, width: 42, height: 42)
        return daysAlex
    }()

    private let bdAlex: UILabel = {
        let alexBD = UILabel()
        alexBD.text = "21.04 - turns 51"
        alexBD.font = UIFont(name: "Verdana", size: 14)
        alexBD.frame = CGRect(x: 100, y: 340, width: 209, height: 20)
        return alexBD
    }()

    // Tom
    private let tomLink: UILabel = {
        let linkTom = UILabel()
        linkTom.text = "Tom Johnson"
        linkTom.frame = CGRect(x: 100, y: 410, width: 209, height: 20)
        linkTom.font = UIFont(name: "Verdana-bold", size: 16)
        return linkTom
    }()

    private let tomPhoto: UIImageView = {
        let tomImage = UIImageView()
        tomImage.image = UIImage(named: "tomImage")
        tomImage.frame = CGRect(x: 20, y: 400, width: 75, height: 75)
        return tomImage
    }()

    private let bdTom: UILabel = {
        let tomBD = UILabel()
        tomBD.text = "05.06 - turns 18"
        tomBD.font = UIFont(name: "Verdana", size: 14)
        tomBD.frame = CGRect(x: 100, y: 435, width: 209, height: 20)
        return tomBD
    }()

    private let tomDays: UIImageView = {
        let daysTom = UIImageView()
        daysTom.image = UIImage(named: "days87Image")
        daysTom.frame = CGRect(x: 330, y: 410, width: 42, height: 42)
        return daysTom
    }()

    private func peopleInfo() {
        // Helena
        view.addSubview(helenaPhoto)
        view.addSubview(helenaLink)
        view.addSubview(bdHelen)
        view.addSubview(cakeForHelen)

        // Verona
        view.addSubview(veronaPhoto)
        view.addSubview(veronaLink)
        view.addSubview(bdVerona)
        view.addSubview(veronaDay)

        // Alex
        view.addSubview(alexPhoto)
        view.addSubview(alexLink)
        view.addSubview(bdAlex)
        view.addSubview(alexDays)

        // Tom
        view.addSubview(tomPhoto)
        view.addSubview(tomLink)
        view.addSubview(bdTom)
        view.addSubview(tomDays)
    }

    @objc func addSettings() {
        // экран настроек
        let profileSetting = ProfielViewController()
        profileSetting.modalPresentationStyle = .automatic
        present(profileSetting, animated: true)
    }
}
