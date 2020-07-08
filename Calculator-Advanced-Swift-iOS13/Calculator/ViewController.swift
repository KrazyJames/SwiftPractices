//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isTyping: Bool = false
    private var operation: CalculatorOperation?
    private var tempNumber: Double?
    private var displayValue: Double {
        get {
            guard let text = displayLabel.text else { fatalError("Cant get the display label value") }
            guard let num = Double(text) else { fatalError("Cant convert to double") }
            return num
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if let currentTitle = sender.currentTitle {
            guard let text = displayLabel.text else { return }
            guard let num = Double(text) else { return }
            switch currentTitle {
            case "AC":
                displayLabel.text = "0"
                tempNumber = nil
                operation = nil
                isTyping = false
            case "+/-":
                if num != 0 {
                    let str = isRoundedNumber(number: String(num * -1))
                    displayLabel.text = str
                }
            case "%":
                if num != 0 {
                    let str = isRoundedNumber(number: String(num / 100))
                    displayLabel.text = str
                    isTyping = false
                }
            case "÷":
                tempNumber = num
                isTyping = false
                operation = .divide
            case "×":
                tempNumber = num
                isTyping = false
                operation = .multiply
            case "-":
                tempNumber = num
                isTyping = false
                operation = .substract
            case "+":
                tempNumber = num
                isTyping = false
                operation = .add
            case "=":
                if operation != nil {
                    calculate(secondNumber: num)
                    operation = nil
                    isTyping = false
                }
            default:
                print("default")
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let num = sender.currentTitle {
            guard let text = displayLabel.text else { return }
            if !isTenDigits(number: text) {
                if isTyping {
                    if num != "." {
                        if text != "0" {
                            displayLabel.text = "\(text)\(num)"
                        } else {
                            displayLabel.text = "\(num)"
                        }
                    }
                } else {
                    if operation != nil {
                        if num == "." {
                            displayLabel.text = "0\(num)"
                        } else {
                            displayLabel.text = "\(num)"
                        }
                        isTyping = true
                    } else {
                        if num != "0" {
                            if num == "." && text == "0" {
                                displayLabel.text = "\(text)\(num)"
                            } else {
                                if num != "." {
                                    displayLabel.text = "\(num)"
                                }
                            }
                            isTyping = true
                        }
                    }
                }
            }
        }
    }
    
    private func isTenDigits(number: String) -> Bool {
        // TODO: Finish this
        if !number.hasPrefix("-") {
            if number.count < 9 {
                return false
            } else {
                return true
            }
        } else {
            if number.count < 10 {
                return false
            } else {
                return true
            }
        }
    }
    
    private func calculate(secondNumber: Double) {
        if let temp = tempNumber {
            switch operation {
            case .add:
                displayLabel.text = isRoundedNumber(number: String(temp + secondNumber))
            case .substract:
                displayLabel.text = isRoundedNumber(number: String(temp - secondNumber))
            case .multiply:
                displayLabel.text = isRoundedNumber(number: String(temp * secondNumber))
            case .divide:
                displayLabel.text = isRoundedNumber(number: String(temp / secondNumber))
            case .none:
                print("Select operation")
            }
        }
    }
    
    private func isRoundedNumber(number: String) -> String? {
        var str = number
        if str.hasSuffix(".0") {
            str.removeLast(2)
        }
        return str
    }
    
}

enum CalculatorOperation {
    case add
    case substract
    case multiply
    case divide
}
