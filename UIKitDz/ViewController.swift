// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addNumbers()
        addGuess()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        introduceYourself()
    }
    
//MARK: Метод для ввода имени пользователя
    func introduceYourself() {
        let name = UIAlertController(title: "Представьтесь", message: "Введите ваше имя", preferredStyle: .alert)
        name.addTextField { textField in
            textField.placeholder = "Имя"
        }
        name.addAction(UIAlertAction(title: "Готово", style: .default, handler: { _ in
            if let textField = name.textFields?.first, let newName = textField.text {
                self.showGreeting(newName)
            }
        }))
        present(name, animated: true, completion: nil)
    }
//MARK: метод для отображения ввода имени
    func showGreeting(_ name: String) {
        let greetingLabel = UILabel(frame: CGRect(x: 0, y: 37, width: 375, height: 90))
        greetingLabel.text = "Приветсвую,\n \(name)!"
        greetingLabel.textAlignment = .center
        greetingLabel.textColor = .white
        greetingLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        greetingLabel.backgroundColor = UIColor(named: "newBlue")
        greetingLabel.lineBreakMode = .byCharWrapping
        greetingLabel.numberOfLines = 0
        view.addSubview(greetingLabel)
    }
//настройки макета
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let backgroundView = UIView(frame: view.bounds)

        if let backgroundImage = UIImage(named: "background_image") {
            let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.frame = view.bounds
            backgroundView.addSubview(backgroundImageView)
        }
        let buttonGuessNumber = UIButton(type: .custom)
        buttonGuessNumber.frame = CGRect(x: 82, y: 301, width: 150, height: 150)
        buttonGuessNumber.backgroundColor = UIColor(named: "newPurple")
        buttonGuessNumber.layer.cornerRadius = 30
        buttonGuessNumber.setTitle("Угадай\n число", for: .normal)
        buttonGuessNumber.titleLabel?.textColor = .white
        buttonGuessNumber.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        buttonGuessNumber.addTarget(self, action: #selector(addGuess), for: .touchUpInside)

        let buttonCalculator = UIButton(type: .custom)
        buttonCalculator.frame = CGRect(x: 132, y: 507, width: 200, height: 200)
        buttonCalculator.layer.cornerRadius = 30
        buttonCalculator.backgroundColor = UIColor(named: "newGreen")
        buttonCalculator.setTitle("Калькулятор", for: .normal)
        buttonCalculator.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonCalculator.titleLabel?.textColor = .white

        view.addSubview(buttonGuessNumber)
        view.addSubview(buttonCalculator)
        view.insertSubview(backgroundView, at: 0)

        buttonCalculator.addTarget(self, action: #selector(addNumbers), for: .touchUpInside)
    }
//MARK: метод для вариантов угадывания числа от 1 до 10
    @objc func addGuess() {
        let randomNumber = Int.random(in: 1 ... 10)
        let guessAlert = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)

        guessAlert.addTextField { textField in
            textField.placeholder = "Число от 1 до 10"
            textField.keyboardType = .numberPad
        }
        guessAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        guessAlert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { _ in
            self.checkGuess(guessAlert.textFields?.first, randomNumber: randomNumber)
        }))
        present(guessAlert, animated: true, completion: nil)
    }
//проверка угадывания
    func checkGuess(_ textField: UITextField?, randomNumber: Int) { guard let guessText = textField?.text,
                                                                          let guess = Int(guessText)
        else {
            return
        }
        if guess == randomNumber {
            showSuccessAlert()
        } else {
            showFailureAlert()
        }
    }
//успешно
    func showSuccessAlert() {
        let successAlert = UIAlertController(title: "Поздравляю", message: "Вы угадали", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(successAlert, animated: true, completion: nil)
    }
//не усмешно
    func showFailureAlert() {
        let failureAlert = UIAlertController(title: "Упс!", message: "Вы не угадали", preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(failureAlert, animated: true, completion: nil)
    }
//MARK: метод для сложения чисел (калькулятор)
    @objc func addNumbers() {
        let calculator = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        calculator.addTextField { textField in
            textField.placeholder = "Число 1"
            textField.keyboardType = .numberPad
        }

        calculator.addTextField { textField in
            textField.placeholder = "Число 2"
            textField.keyboardType = .numberPad
        }
        calculator.addAction(UIAlertAction(title: "Сложить", style: .default, handler: { _ in
            if let textField1 = calculator.textFields?[0], let textField2 = calculator.textFields?[1],
               let num1 = Int(textField1.text ?? ""),
               let num2 = Int(textField2.text ?? "") { let sum = num1 + num2; self.resultSum(sum) }
        }))
        calculator.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        present(calculator, animated: true, completion: nil)
    }
//результат калькулятора
    func resultSum(_ result: Int) {
        let resultAlert = UIAlertController(
            title: "Ваш результат",
            message: "Результат вычислений  \(result)",
            preferredStyle: .alert
        )
        resultAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        resultAlert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(resultAlert, animated: true, completion: nil)
    }
}
