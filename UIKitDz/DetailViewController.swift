// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

final class DetailViewController: UIViewController {
    // MARK: - @IBOutlet

    // название трека - лейбл
    @IBOutlet var nameTrackLabel: UILabel!
    // стоп/плей - кнопка
    @IBOutlet var playButton: UIButton!
    // продолжительность трека - слайдер
    @IBOutlet var durationSlider: UISlider!
    // громкость - слайдер
    @IBOutlet var volumeSlider: UISlider! {
        didSet {
            volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        } //поворот слайдера громкости
    }

    private var player = AVAudioPlayer()
    private var song = ""

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    // MARK: - Audio Player Configuration
//создание плеера
    func configureAudioPlayer(music: String) {
        do {
            if let songRoad = Bundle.main.path(forResource: music, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: songRoad))
            }
        } catch {
            print("Error")
        }
        song = music
        player.play()
    }
    
    // MARK: - private propites
//настройка пользовательного интерфейса
    private func makeUI() {
        playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        nameTrackLabel.text = song
        configureVolumeSlider()
        setupSlider()
    }
//настройка слайдера продолжительности
    private func setupSlider() {
        durationSlider.minimumValue = 0.0
        durationSlider.maximumValue = 100.0
        durationSlider.maximumValue = Float(player.duration)
        durationSlider.value = 0.0
        Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTime),
            userInfo: nil,
            repeats: true
        )
        durationSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
    }
//обновление времени песни
    @objc func updateTime(_ timer: Timer) {
        durationSlider.value = Float(player.currentTime)
    }
//позиция трека в соответсивии слайдера
    @objc func changeSlider(sender: UISlider) {
        if sender == durationSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
//слайдер гроскости
    private func configureVolumeSlider() {
        volumeSlider.value = 100
        volumeSlider.addTarget(self, action: #selector(setupVolumeSlider), for: .valueChanged)
    }
//изменение громкости совместно со слайдером
    @objc func setupVolumeSlider() {
        player.volume = volumeSlider.value
    }
    // MARK: - @IBAction
    //закрытие текущего экрана
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
//воспроизведение/пауза
    @IBAction func playPausePlayer(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        } else {
            playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            player.play()
        }
    }

//воспроизведение предыдущего трека
    @IBAction func backwordTrack(_ sender: Any) {
        configureAudioPlayer(music: "АИГЕЛ - Пыяла")
        nameTrackLabel.text = song
    }
//следующего тека
    @IBAction func forwardTrack(_ sender: Any) {
        configureAudioPlayer(music: "Kiss -  I was made")
        nameTrackLabel.text = song
    }
}
