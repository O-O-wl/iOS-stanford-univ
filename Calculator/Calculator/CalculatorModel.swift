//
//  CalculatorModel.swift
//  Calculator
//
//  Created by 이동영 on 27/12/2018.
//  Copyright © 2018 이동영. All rights reserved.
//

import Foundation

class CalculatorModel{
    
    private var accumulator = 0.0
    
    
    private var operations : Dictionary<String , Double > = [
    "π" : M_PI,
    "e" : M_E ]
    
    
    func setOperand(operand : Double){}
    
    func performOperation(symbol : String){
        if let constant = operations[symbol]{
            accumulator = constant
        }
        }
    
    
    var result : Double{
        get{
            return accumulator
            
        }
    }
    
}
