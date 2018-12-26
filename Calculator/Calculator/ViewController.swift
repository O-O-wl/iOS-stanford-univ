//
//  ViewController.swift
//  Calculator
//
//  Created by 이동영 on 26/12/2018.
//  Copyright © 2018 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    
    @IBOutlet weak var display: UILabel!
   
    @IBAction func touchDigit(_ sender: UIButton) {
        var digit = sender.currentTitle!
         let textCurrentlyInDisplay = self.display.text!
        if(userIsInTheMiddleOfTyping){
        
        display.text = textCurrentlyInDisplay+digit
        }
        else{
            display.text=digit
        }
        userIsInTheMiddleOfTyping=true
    }
    
   
    
}


