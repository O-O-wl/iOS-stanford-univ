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
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "cos": Operation.UnaryOperation(cos),
        "√":Operation.UnaryOperation(sqrt),
        "-":Operation.BinaryOperation({$0 - $1 }),
        "+":Operation.BinaryOperation({$0 + $1 }),
        "×":Operation.BinaryOperation({$0 * $1 }),
        "÷":Operation.BinaryOperation({$0 / $1 }),
        "=":Operation.Equals
    ]
    
    
    //======================
    // 열거형: 단항 이항 상수 연산
    //======================
    enum Operation{
        case  Constant(Double)
        case  UnaryOperation((Double)->Double)
        case  BinaryOperation((Double, Double) -> Double)
        case  Equals
    }
    
    func setOperand(operand : Double){
        accumulator=operand
    }
    
    //==================================================
    // Swift에서 switch문은 모든 경우를 다 따져줘야함
    // enum 열거형으로 분기시 enum의 프로퍼티만큼의 case가 있으면 됨
    //==================================================
    func performOperation(symbol : String){
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let associatedValue): accumulator = associatedValue
            case .UnaryOperation(let associateFunction): accumulator = associateFunction(accumulator)
            case .BinaryOperation (let function) :
                executePendingBinaryOperation()
                pending = PengingBinaryOperationInfo(firstOperand:accumulator, binaryFunction:function)
            case .Equals:
                executePendingBinaryOperation()
            }
            
        }
    }
    
    //==========================
    //     = 연산이랑 , 또는
    //     체이닝 연산에서 불려짐
    //=========================
    
    private func executePendingBinaryOperation(){
    
        if(pending != nil){
            accumulator  = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending = nil
        }
    }
    
    var pending : PengingBinaryOperationInfo?
    
    
    /************************************
            구조체 : 값 을 전달
        클래스와 다르게 생성시 무조건
        초기화 해주므로 , 선언시는 초기화 불필요
     *************************************/
    
    struct PengingBinaryOperationInfo {
        var firstOperand : Double
        var binaryFunction : (Double,Double) -> Double
        
    }
    
    var result : Double{
        get{
            
            return accumulator
            
        }
    }
    
}
