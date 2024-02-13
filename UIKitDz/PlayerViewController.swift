// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

final class PlayerViewController: UIViewController {
    // MARK: - IBAction

    // метод для запуска трека
    @IBAction func playTrack(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as? DetailViewController
        else {
            return
        }
        detailVC.configureAudioPlayer(music: "")
        present(detailVC, animated: true)
    }
}
