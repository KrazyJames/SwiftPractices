//
//  Calculator.swift
//  Calculator
//
//  Created by Jaime Escobar on 07/07/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    
    var number: Double?
    
    private var calculation: (number1: Double, symbol: String)?
    
    mutating func calculate(symbol: String) -> Double? {
        if let number = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return number * -1
            case "%":
                return number / 100
            case "+", "-", "×", "÷":
                calculation = (number1: number, symbol: symbol)
            case "=":
                return self.perfomCalculation(number: number)
            default:
                return nil
            }
        }
        return nil
    }
    
    private func perfomCalculation(number: Double) -> Double? {
        if let n1 = calculation?.number1, let operation = calculation?.symbol {
            switch operation {
            case "+":
                return n1 + number
            case "-":
                return n1 - number
            case "×":
                return n1 * number
            case "÷":
                return n1 / number
            default:
                return nil
            }
        }
        return nil
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
}
