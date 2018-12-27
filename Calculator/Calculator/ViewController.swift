//
//  ViewController.swift
//  Calculator
//
//  Created by 이동영 on 26/12/2018.
//  Copyright © 2018 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 사용자 입력중인지를 나타내는 플래그
    var userIsInTheMiddleOfTyping = false
    
    // 라벨 --
    @IBOutlet weak var display: UILabel!
   
    // 숫자키패드의 입력에 대한 콜백메소드
    @IBAction func touchDigit(_ sender: UIButton) {
        
        // 버튼에서 title 추출
        let digit = sender.currentTitle!
        
        // 라벨에 직접적으로 들어갈 String  : 자동 형변환
        let textCurrentlyInDisplay = self.display.text!
        
        
        if(userIsInTheMiddleOfTyping){
            display.text = String(Int(textCurrentlyInDisplay + digit)!) //
        }
        else{
            display.text=digit
        }
        userIsInTheMiddleOfTyping=true
    }
    
   // 연산자 키패드버튼의 엽력에 대한 콜백 메소드
    @IBAction func performOperation(_ sender: UIButton) {
        
        userIsInTheMiddleOfTyping=false
        
        // 연산자 키버튼에서 연산자 추출
        if let mathematicalSymbol = sender.currentTitle{

        if(mathematicalSymbol == "𝝿"){
            display.text = String(Double.pi)}
            
        
        }
        
    }
    
    
}


