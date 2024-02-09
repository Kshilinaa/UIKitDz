// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// LoginViewController авторизация
class LoginViewController: UIViewController {
    @IBOutlet var loginTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var sendButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        passwordTextField.delegate = self
        loginTextField.delegate = self
        sendButton.isEnabled = false
    }
}

// расширение для обработки событий
extension LoginViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        // получили текста из полей почта/пароль и установили валидность
        let password = passwordTextField?.text ?? ""
        let login = loginTextField?.text ?? ""

        let isPasswordValid = password.count > 1
        let isLoginValid = login.count > 1

        sendButton?.isEnabled = isPasswordValid && isLoginValid

        return true
    }
}
