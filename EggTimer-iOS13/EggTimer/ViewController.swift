//
//  ViewController.swift
//  EggTimer
//
//  Created by Jaime Escobar on 22/01/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    let eggTimes = ["Soft":5,"Medium":8,"Hard":12]

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func EggPressed(_ sender: UIButton) {
        progressBar.setProgress(0.0, animated: true)
        let hardness = sender.currentTitle!
        //TODO: Insert a timer, documentation: https://developer.apple.com/documentation/foundation/
        let totalTime = Float(eggTimes[hardness]!)
        var timeLeft = totalTime//*60 //for minutes
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print(timeLeft)
            timeLeft -= 1
            let progress = 1 - timeLeft/totalTime
            self.progressBar.setProgress(progress, animated: true)
            if(timeLeft==0){
                timer.invalidate()
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
            }
        }
    }
}
