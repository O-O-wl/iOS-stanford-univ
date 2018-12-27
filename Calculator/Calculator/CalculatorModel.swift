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
    
    func setOperand(operand : Double){}
    
    func performOperation(symbol : String){
        switch symbol {
        case "π":
            accumulator=Double.pi
        case "√":
            accumulator=sqrt(accumulator)
        default:
            break
        }
        
    }
    
    var result : Double{
        get{
            return accumulator
            
        }
    }
    
}
