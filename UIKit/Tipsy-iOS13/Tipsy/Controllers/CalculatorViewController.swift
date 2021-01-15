//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var tip: Float = 0.1
    var result: String = ""
    var numberPeople: Int = 2
    let segueIdentifier = "goToResult"
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let res = (Float(billTextField.text!)! * (1 + tip)) / Float(numberPeople)
        result = String(format: "%.2f", res)
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier{
            let resultVC = segue.destination as! ResultsViewController
            
            resultVC.result = result
            resultVC.tip = Int(tip * 100)
            resultVC.split = numberPeople
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let title = sender.currentTitle!
        
        if title.prefix(1) == "1" {
            self.tip = 0.1
        } else if title.prefix(1) == "2" {
            self.tip = 0.2
        } else {
            self.tip = 0.0
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberPeople = Int(sender.value)
        splitNumberLabel.text = String(numberPeople)
    }
}

