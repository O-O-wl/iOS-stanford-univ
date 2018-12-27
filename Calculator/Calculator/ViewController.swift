//
//  ViewController.swift
//  Calculator
//
//  Created by 이동영 on 26/12/2018.
//  Copyright © 2018 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //==============================================
    //             계산 프로퍼티 ?
    //  + 변수를 호출 , 수정 할때 자동으로 밑의 메소드들이 실행됨
    //  + 그 내에서 다른 프로퍼티들도 접근 가능
    //===============================================
    var displayValue : Double{
        get{ // display.text 가 형변환이 불가능할수도있기떄문에 옵셔널강제추출이 필요
            return Double(display.text!)!;
        }
        set{
            // newValue는 displayValue(Double)에 set하려는 입력값
            display.text = String(newValue)
        }
    }
    //==================================
    //    사용자 입력중인지를 나타내는 플래그
    //==================================
    var userIsInTheMiddleOfTyping = false
    
    //===============
    //   입력창 라벨
    //===============
    @IBOutlet weak var display: UILabel!
   
    //===============================
    //    숫자키패드의 입력에 대한 콜백메소드
    //===============================
    @IBAction func touchDigit(_ sender: UIButton) {
        
        /************************
            버튼에서 title 추출
        *************************/
        let digit = sender.currentTitle!
        
        // 라벨에 직접적으로 들어갈 String  : 자동 형변환
        let textCurrentlyInDisplay = self.display.text!
        
        
        if(userIsInTheMiddleOfTyping){
            display.text = textCurrentlyInDisplay + digit //
        }
        else{
            display.text=digit
        }
        userIsInTheMiddleOfTyping=true
    }
   //====================================
   // 연산자 키패드버튼의 엽력에 대한 콜백 메소드
   //====================================
    @IBAction func performOperation(_ sender: UIButton) {
        
        userIsInTheMiddleOfTyping=false
        
        // 연산자 키버튼에서 연산자 추출
        if let mathematicalSymbol = sender.currentTitle{

        if(mathematicalSymbol == "𝝿"){
            displayValue = Double.pi;
        }
        else if(mathematicalSymbol == "√")
            
        {displayValue = sqrt(displayValue)
         
            }
        
    }
    
    
}


}
