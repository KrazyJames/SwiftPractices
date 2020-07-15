//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var calc = Calculator()
    @IBOutlet weak var displayLabel: UILabel!
    private var isTyping: Bool = false
    private var displayValue: Double {
        get {
            guard let text = displayLabel.text else { fatalError("Cant get display label text") }
            guard let double = Double(text) else { fatalError("Cant convert to double") }
            return double
        }
        set {
            var text: String?
            if newValue.isFinite {
                if floor(newValue) == newValue {
                    text = String(Int(newValue))
                } else {
                    text = String(newValue)
                }
                displayLabel.text = text
            } else {
                displayLabel.text = "error"
            }
            
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if let currentTitle = sender.currentTitle {
            if currentTitle == "AC" {
                displayValue = 0
            } else {
                calc.setNumber(displayValue)
                if let res = calc.calculate(symbol: currentTitle) {
                    displayValue = res
                }
            }
            isTyping = false
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if isTyping {
                guard let text = displayLabel.text else { return }
                if digit == "." {
                    if text.contains(digit) {
                        return
                    }
                }
                displayLabel.text = text + digit
            } else {
                if digit == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = digit
                }
                isTyping = true
            }
        }
    }
}
