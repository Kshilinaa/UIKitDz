// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    var buttonStart: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // MARK: - Create Start Button

        buttonStart = UIButton(type: .system)
        buttonStart.setTitle("Начать", for: .normal)
        buttonStart.frame = CGRect(x: 20, y: 40, width: 335, height: 44)
        buttonStart.center = CGPoint(x: view.center.x, y: view.center.y)
        buttonStart.backgroundColor = UIColor(named: "newGreen")
        buttonStart.layer.cornerRadius = 12
        buttonStart.setTitleColor(.white, for: .normal)
        buttonStart.addTarget(self, action: #selector(startButtonTap), for: .touchUpInside)
        view.addSubview(buttonStart)
    }

    // MARK: - Handle Start Button Tap

    @objc func startButtonTap() {
        let buttonAlert = UIAlertController(title: "Введите слово", message: nil, preferredStyle: .alert)
        buttonAlert.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        buttonAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        buttonAlert.addAction(UIAlertAction(title: "Ок", style: .default) { _ in
            if let textField = buttonAlert.textFields?.first, let word = textField.text {
                self.showResult(word)
            }
        })
        present(buttonAlert, animated: true, completion: nil)
    }

    // MARK: - Display Result

    func showResult(_ word: String) {
        let topLabel = UILabel(frame: CGRect(x: 50, y: 106, width: 275, height: 57))
        topLabel.textAlignment = .center
        topLabel.font = UIFont.boldSystemFont(ofSize: 16)
        topLabel.text = "Вы ввели слово"
        view.addSubview(topLabel)

        let enteredWordLabel = UILabel(frame: CGRect(x: 50, y: 250, width: 275, height: 57))
        enteredWordLabel.textAlignment = .center
        enteredWordLabel.font = UIFont.italicSystemFont(ofSize: 16)
        enteredWordLabel.textColor = .gray
        enteredWordLabel.text = word
        view.addSubview(enteredWordLabel)

        let reversedTextLabel = UILabel(frame: CGRect(x: 50, y: 339, width: 275, height: 57))
        reversedTextLabel.textAlignment = .center
        reversedTextLabel.font = UIFont.boldSystemFont(ofSize: 16)
        reversedTextLabel.text = "А вот что получится, если\nчитать справо налево"
        reversedTextLabel.numberOfLines = 2
        view.addSubview(reversedTextLabel)

        let reversedWordLabel = UILabel(frame: CGRect(x: 50, y: 396, width: 275, height: 57))
        reversedWordLabel.textAlignment = .center
        reversedWordLabel.font = UIFont.italicSystemFont(ofSize: 16)
        reversedWordLabel.textColor = .gray
        reversedWordLabel.text = String(word.reversed())
        view.addSubview(reversedWordLabel)

        // перемещение кнопки начать вниз
        buttonStart.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
    }
}
