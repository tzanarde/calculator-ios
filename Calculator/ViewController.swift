//
//  ViewController.swift
//  Calculator
//
//  Created by Tiago Zanarde on 19/02/24.
//

import UIKit

extension Double {
    var removeZero: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {
    
    let zeroSymbol = "0"
    let oneSymbol = "1"
    let twoSymbol = "2"
    let threeSymbol = "3"
    let fourSymbol = "4"
    let fiveSymbol = "5"
    let sixSymbol = "6"
    let sevenSymbol = "7"
    let eightSymbol = "8"
    let nineSymbol = "9"
    let decimalSymbol = "."
    
    var firstValue = 0.0
    var secondValue = 0.0
    
    var result = 0.0
    
    var firstValueSet = false
    var secondValueSet = false
    
    var cleanLabelOnNextSymbol = false
    
    var currentOperation = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func addSymbolToResultLabel(symbol: String) {
        if resultLabel.text == "0" && symbol != "." {
            resultLabel.text = ""
        }
        
        if cleanLabelOnNextSymbol {
            if currentOperation == "" {
                reset()
            }
            
            if symbol == "." {
                resultLabel.text = "0" + symbol
            } else {
                resultLabel.text = symbol
            }
            cleanLabelOnNextSymbol = false
        } else {
            resultLabel.text = resultLabel.text! + symbol
        }
    }
    
    func setOperation(operation: String) {
        cleanLabelOnNextSymbol = true
        currentOperation = operation
    }
    
    func exchangeValues() {
        firstValue = result
        secondValue = 0.0
        firstValueSet = true
        secondValueSet = false
        cleanLabelOnNextSymbol = false
        currentOperation = ""
    }
    
    func equals() {
        if firstValueSet && secondValueSet {
            switch currentOperation {
            case "plus":
                result = firstValue + (Double(resultLabel.text!) ?? 0)
            case "minus":
                result = firstValue - (Double(resultLabel.text!) ?? 0)
            case "multiplication":
                result = firstValue * (Double(resultLabel.text!) ?? 0)
            case "division":
                result = firstValue / (Double(resultLabel.text!) ?? 0)
            default:
                print("default")
            }
            exchangeValues()
            cleanLabelOnNextSymbol = true
            resultLabel.text = String(result.removeZero)
        }
    }

    func setValue() {
        if !firstValueSet && !secondValueSet {
            firstValue = Double(resultLabel.text!) ?? 0
            firstValueSet = true
        } else if firstValueSet && !secondValueSet {
            secondValue = Double(resultLabel.text!) ?? 0
            secondValueSet = true
        }
    }
    
    func reset() {
        resultLabel.text = "0"
        firstValue = 0.0
        secondValue = 0.0
        firstValueSet = false
        secondValueSet = false
        result = 0.0
        cleanLabelOnNextSymbol = false
        currentOperation = ""
    }
    
    // Number Buttons
    @IBAction func decimalButton(_ sender: UIButton) {
        if !resultLabel.text!.contains(".") {
            resultLabel.text = resultLabel.text! + decimalSymbol
        }
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: zeroSymbol)
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: oneSymbol)
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: twoSymbol)
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: threeSymbol)
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: fourSymbol)
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: fiveSymbol)
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: sixSymbol)
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: sevenSymbol)
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: eightSymbol)
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        addSymbolToResultLabel(symbol: nineSymbol)
    }
    
    // Function Buttons
    @IBAction func acButton(_ sender: UIButton) {
        reset()
    }
    
    @IBAction func plusminusButton(_ sender: UIButton) {
//        firstValue = (Double(resultLabel.text!) ?? 0) * -1
//        resultLabel.text = String(firstValue.removeZero)
    }
    
    @IBAction func percentageButton(_ sender: UIButton) {
//        firstValue = (Double(resultLabel.text!) ?? 0) / 100
//        resultLabel.text = String(firstValue.removeZero)
    }
    
    @IBAction func divisionButton(_ sender: UIButton) {
        setValue()
        equals()
        setOperation(operation: "division")
    }
    
    @IBAction func multiplicationButton(_ sender: UIButton) {
        setValue()
        equals()
        setOperation(operation: "multiplication")
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        setValue()
        equals()
        setOperation(operation: "minus")
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        setValue()
        equals()
        setOperation(operation: "plus")
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        setValue()
        equals()
    }
}

