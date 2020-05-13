//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Jaime Escobar on 01/18/2020.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    let dices = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func rollBtnPressed(_ sender: UIButton) {
        diceImage1.image = dices.randomElement()
        diceImage2.image = dices.randomElement()
    }
    
    
    
}

