//
//  ViewController.swift
//  Xylophone
//
//  Created by Yavuz Ulgar on 12/04/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let buttonTag = sender.tag
        
        playSound(key: "Audio\(buttonTag)")
    }
    
    private func playSound(key: String) {
        guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else {return}
            
            player.play()
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

