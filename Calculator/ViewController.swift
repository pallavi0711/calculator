//
//  ViewController.swift
//  Calculator
//
//  Created by Admin on 12/03/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var digitLabel: UILabel!
    override var traitCollection:UITraitCollection {
        if UIDevice.current.orientation.isPortrait {
            return UITraitCollection(traitsFrom: [UITraitCollection(horizontalSizeClass: .compact),UITraitCollection(verticalSizeClass: .regular)])
        }
        return super.traitCollection
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("Orientation Changed")
        if  UIDevice.current.orientation.isPortrait{
            print("Its Inside Function")
            //let newFrame = CGRect(x: 0, y: 0, width: 500, height: 100)
            digitLabel.frame.size.height = 500
        }
    }
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        // calculators changes....
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }  else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
    var displayValue:Double {
        
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {

        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathmeticalSymbol = sender.currentTitle {
            brain.peroformOperation(mathmeticalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
    
}

