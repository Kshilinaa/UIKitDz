// ProfielViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ProfielViewController
class ProfielViewController: UIViewController {
    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        agePicker.delegate = self
        agePicker.dataSource = self
        ageTextField.inputView = agePicker

        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderTextField.inputView = genderPicker

        birthdayText.inputView = datePickerView
        datePickerView.preferredDatePickerStyle = .wheels

        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)

        setElements()

        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(onClickDoneButton)
        )
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        birthdayText.inputAccessoryView = toolBar
        ageTextField.inputAccessoryView = toolBar
        genderTextField.inputAccessoryView = toolBar
    }

    private let agePickerData = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40
    ]
    private let agePicker = UIPickerView()
    private let gender = ["Male", "Female"]
    private let genderPicker = UIPickerView()

    // кнопка добавления
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 330, y: 20, width: 50, height: 20)
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        return button
    }()

    // кнопка "Отмена"
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 20, width: 50, height: 20)
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        return button
    }()

    // изображение пользователя
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userImage")
        imageView.frame = CGRect(x: 130, y: 70, width: 125, height: 125)
        return imageView
    }()

    // кнопка Изменить фото
    private let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change photo", for: .normal)
        button.frame = CGRect(x: 130, y: 210, width: 125, height: 20)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        return button
    }()

    // лейбл имени пользователя
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.frame = CGRect(x: 20, y: 250, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    // поле  ввода имени пользователя
    private let nameText: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Name Surname")
        textField.frame = CGRect(x: 20, y: 280, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    // полоска под именем пользователя
    private let nameUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 305, width: 345, height: 1)
        return view
    }()

    // Лейбл даты рождения
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday"
        label.frame = CGRect(x: 20, y: 330, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    // Поле  ввода даты рождения
    private let birthdayText: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Date of Birth")
        textField.frame = CGRect(x: 20, y: 360, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    // полоска под датой
    private let birthdayUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 385, width: 345, height: 1)
        return view
    }()

    // Лейбл  возраста
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.frame = CGRect(x: 20, y: 410, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    // поле для ввода возраста
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing age")
        textField.frame = CGRect(x: 20, y: 440, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    // полоска под возрастом
    private let ageUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 465, width: 345, height: 1)
        return view
    }()

    // лейбл для пола
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.frame = CGRect(x: 20, y: 490, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    // поле для выбора пола
    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Indicate Gender")
        textField.frame = CGRect(x: 20, y: 520, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        return textField
    }()

    // полоска под полом
    private let genderUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 545, width: 345, height: 1)
        return view
    }()

    // лейбо тг
    private let telegramLabel: UILabel = {
        let label = UILabel()
        label.text = "Telegram"
        label.frame = CGRect(x: 20, y: 570, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    // текстовое поле тг
    private lazy var telegramTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = .init(string: "Typing Telegram")
        textField.frame = CGRect(x: 20, y: 600, width: 175, height: 17)
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.addTarget(self, action: #selector(alertMessageTelegram), for: .editingDidBegin)
        return textField
    }()

    // полоска под тг
    private let telegramUnderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.frame = CGRect(x: 20, y: 625, width: 345, height: 1)
        return view
    }()

    private let datePickerView: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        return datePicker
    }()

    // MARK: - Public Methods

    func setElements() {
        view.addSubview(cancelButton)
        view.addSubview(addButton)

        view.addSubview(photoImageView)
        view.addSubview(changePhotoButton)

        view.addSubview(nameLabel)
        view.addSubview(nameText)
        view.addSubview(nameUnderView)

        view.addSubview(birthdayLabel)
        view.addSubview(birthdayText)
        view.addSubview(birthdayUnderView)

        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(ageUnderView)

        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(genderUnderView)

        view.addSubview(telegramLabel)
        view.addSubview(telegramTextField)
        view.addSubview(telegramUnderView)
    }

    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        birthdayText.text = dateFormatter.string(from: sender.date)
    }

    @objc func onClickDoneButton() {
        view.endEditing(true)
    }

    @objc func alertMessageTelegram() {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            if (self.telegramTextField.text?.isEmpty) != nil {
                self.telegramTextField.text = alertController.textFields?.first?.text
            }
        }

        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertAction)
        alertController.addAction(alertCancel)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Extensions

extension ProfielViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            return agePickerData.count
        } else {
            return gender.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker {
            return "\(agePickerData[row])"
        } else {
            return gender[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePicker {
            ageTextField.text = "\(agePickerData[row])"
        } else {
            genderTextField.text = gender[row]
        }
    }
}
