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
    
    /******************************
     *    딕셔너리
     *    연산자(문자열) : 열거형 구조
     ******************************/
    private var operations : Dictionary<String , Operation > = [
        "π" : Operation.Constant,
        "e" : Operation.UnaryOperation,
        "cos": Operation.UnaryOperation,
        "√":Operation.UnaryOperation,
        ]
    
    
    //======================
    // 열거형: 단항 이항 상수 연산
    //======================
    enum Operation{
        case  Constant
        case  UnaryOperation
        case  BinaryOperation
        case  Equals
    }
    
    func setOperand(operand : Double){}
    
    //==================================================
    // Swift에서 switch문은 모든 경우를 다 따져줘야함
    // enum 열거형으로 분기시 enum의 프로퍼티만큼의 case가 있으면 됨
    //==================================================
    func performOperation(symbol : String){
        if let operation = operations[symbol]{
        switch operation {
        case .Constant:break
        case .UnaryOperation:break
        case .BinaryOperation:break
        case .Equals:break
            }}
    }
    
    
    var result : Double{
        get{
            return accumulator
            
        }
    }
    
}
