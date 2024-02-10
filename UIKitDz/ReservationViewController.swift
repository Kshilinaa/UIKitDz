// ReservationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class ReservationViewController реализация класс для нового вью
class ReservationViewController: UIViewController {
    //MARK: IBAction
    @IBAction func takeCheckButton(_ sender: Any) {
        let billAlert = UIAlertController(title: "Выставить счет", message: nil, preferredStyle: .alert)
        let cancelAlert = UIAlertAction(title: "Отмена", style: .default)
        let checkAlert = UIAlertAction(title: "Чек", style: .default) { _ in

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let billViewController = storyboard.instantiateViewController(withIdentifier: "resultViewController")

            self.navigationController?.pushViewController(billViewController, animated: true)
        }

        billAlert.addAction(cancelAlert)
        billAlert.addAction(checkAlert)
        billAlert.preferredAction = checkAlert

        present(billAlert, animated: true)
    }
}
