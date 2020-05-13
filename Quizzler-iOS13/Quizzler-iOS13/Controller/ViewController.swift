//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Jaime Escobar on 24/01/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var quiz = Quiz()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restore()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quiz.checkAnswer(sender.currentTitle!){
            sender.backgroundColor = UIColor.systemGreen
        }else{
            sender.backgroundColor = UIColor.systemRed
        }
        if quiz.question < 11{
            quiz.increaseQuestionNumber()
        }else{
            quiz = Quiz()
            questionLabel.text = "DONE!"
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(restore), userInfo: nil, repeats: false)
        }
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(restore), userInfo: nil, repeats: false)
        
    }
    
    @objc func restore(){
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quiz.getProgress()
        questionLabel.text = quiz.getNextQuestion()
        scoreLabel.text = "Score: \(quiz.getScore())"
    }
    
}

