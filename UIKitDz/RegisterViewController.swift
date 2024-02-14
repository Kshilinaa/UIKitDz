// RegisterViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - RegisterViewController

// Первый экран авторизации
class RegisterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        setupTextFieldsObservation()
    }
    // MARK: - UI Elements
    private let calendar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendarImage")
        imageView.frame = CGRect(x: 130, y: 50, width: 125, height: 125)
        return imageView
    }()

    private let reminderDr: UILabel = {
        let birthday = UILabel()
        birthday.text = "Birthday\nReminder"
        birthday.frame = CGRect(x: 150, y: 180, width: 175, height: 44)
        birthday.numberOfLines = 0
        birthday.textColor = UIColor(named: "fullPurple")
        birthday.font = UIFont(name: "Verdana-bold", size: 18)
        return birthday
    }()

    private let signIn: UILabel = {
        let signLabel = UILabel()
        signLabel.text = "Sign In"
        signLabel.frame = CGRect(x: 20, y: 250, width: 175, height: 31)
        signLabel.font = UIFont(name: "Verdana-bold", size: 18)
        signLabel.textColor = UIColor(named: "newRed")
        return signLabel
    }()

    private let email: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.frame = CGRect(x: 20, y: 300, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.textColor = UIColor(named: "newRed")
        return label
    }()

    private let emailText: UITextField = {
        let text = UITextField()
        text.attributedPlaceholder = .init(string: "Typing email")
        text.font = UIFont(name: "Verdana-bold", size: 14)
        text.frame = CGRect(x: 20, y: 330, width: 175, height: 17)
        return text
    }()

    private let lineEmail: UIView = {
        let emailLine = UIView()
        emailLine.frame = CGRect(x: 20, y: 355, width: 345, height: 1)
        emailLine.backgroundColor = .systemGray
        return emailLine
    }()

    private let password: UILabel = {
        let labelPas = UILabel()
        labelPas.text = "Password"
        labelPas.font = UIFont(name: "Verdana-bold", size: 16)
        labelPas.textColor = UIColor(named: "newRed")
        labelPas.frame = CGRect(x: 20, y: 370, width: 175, height: 19)
        return labelPas
    }()

    private let textInPassword: UITextField = {
        let passText = UITextField()
        passText.attributedPlaceholder = .init(string: "Typying password")
        passText.font = UIFont(name: "Verdana", size: 14)
        passText.frame = CGRect(x: 20, y: 400, width: 175, height: 17)
        passText.isSecureTextEntry = true
        return passText
    }()

    private let linePass: UIView = {
        let passline = UIView()
        passline.backgroundColor = .systemGray
        passline.frame = CGRect(x: 20, y: 425, width: 345, height: 1)
        return passline
    }()

    private let eyeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hiddenImage")
        imageView.frame = CGRect(x: 340, y: 400, width: 22, height: 19)
        return imageView
    }()

    private let faceIDText: UILabel = {
        let textSwich = UILabel()
        textSwich.text = "Use FaceID"
        textSwich.textColor = .black
        textSwich.font = UIFont(name: "Verdana-bold", size: 16)
        textSwich.frame = CGRect(x: 130, y: 550, width: 150, height: 35)
        textSwich.isHidden = true
        return textSwich
    }()

    private let faceID: UISwitch = {
        let faceID = UISwitch()
        faceID.isOn = true
        faceID.isHidden = true
        faceID.frame = CGRect(x: 270, y: 550, width: 54, height: 35)
        return faceID
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = UIColor(named: "newRed")
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 20, y: 700, width: 345, height: 44)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
// MARK: - Private Methods
    private func setElements() {
        view.addSubview(calendar)
        view.addSubview(reminderDr)
        view.addSubview(signIn)
        view.addSubview(email)
        view.addSubview(emailText)
        view.addSubview(lineEmail)
        view.addSubview(password)
        view.addSubview(textInPassword)
        view.addSubview(linePass)
        view.addSubview(eyeImage)
        view.addSubview(faceIDText)
        view.addSubview(faceID)
        view.addSubview(loginButton)
    }
// MARK: - Text Field Observations
    // отслеживания изменений в текстовых полях
    @objc private func setupTextFieldsObservation() {
        emailText.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
        textInPassword.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
    }
// MARK: - Text Field Change Handling
    // проверка заполненности полей для активации кнопки входа
    @objc private func changedTextFields(_ textField: UITextField) {
        guard let email = emailText.text,
              !email.isEmpty,
              let password = textInPassword.text,
              !password.isEmpty
        else {
            loginButton.isEnabled = false
            return
        }
        loginButton.isEnabled = true
        faceIDText.isHidden = false
        faceID.isHidden = false
        loginButton.backgroundColor = UIColor(named: "newRed")
    }
// MARK: - Login Button Action
    // обработчик нажатия на кнопку входа
    @objc private func loginButtonTapped() {
        let birthdaysList = BirthdaysList()
        navigationController?.pushViewController(birthdaysList, animated: true)
    }
}
