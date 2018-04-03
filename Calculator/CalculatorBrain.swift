//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Admin on 12/03/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation



struct  CalculatorBrain{
    
    private var accumlator:Double?
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation( (Double, Double) -> Double)
        case equal
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "±": Operation.unaryOperation{-$0},
        "×": Operation.binaryOperation{$0 * $1},
        "+": Operation.binaryOperation{$0 + $1},
        "-": Operation.binaryOperation{$0 - $1},
        "÷": Operation.binaryOperation{$0 / $1},
        "=": Operation.equal
    ]
    
    mutating func peroformOperation(_ symbol:String){
        if let  operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumlator = value
            case .unaryOperation(let fun):
                accumlator = fun(accumlator!)
            case .binaryOperation(let fun):
                if accumlator != nil {
                    pbo = PendingBinaryOperation(function: fun, firstOperand: accumlator!)
                }
            case .equal:
                performPenidngBinaryOperation()
            }
        }
    }
    
   mutating private func performPenidngBinaryOperation() {
        if pbo != nil && accumlator != nil {
            accumlator = pbo?.perform(with: accumlator!)
            pbo = nil
        }
    }
    
    private var pbo : PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function:(Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand:Double) -> Double{
            return function(firstOperand, secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double){
        accumlator = operand
    }
    
    var result: Double?{
        get {
            return accumlator
        }
    }
    
    
    
}
