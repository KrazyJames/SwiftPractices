//
//  ViewController.swift
//  Xylophone
//
//  Created by Jaime Escobar on 20/01/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func KeyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        //Reduce sender's opacity to 50% transparent
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0}
    }
    
    func playSound(soundName: String) {
        //Loads the sound from package with the file's name and extension
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

