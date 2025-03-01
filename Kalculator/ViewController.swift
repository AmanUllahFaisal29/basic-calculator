//
//  ViewController.swift
//  Kalculator
//
//  Created by JOGENDRA on 18/05/17.
//  Copyright © 2017 Jogendra Singh. All rights reserved.
//  Application Development in iOS Devices
//  Assignment 3
//  AmanUllah Faisal 22944

import UIKit
import Foundation

class ViewController: UIViewController {
    
    public var calculator:Calculator?
    @IBOutlet weak var resultScreen: UILabel!
    
    @IBAction func inputDigit(_ sender: Any) {
        if let button = sender as? UIButton{
            do{
                if let output = try calculator?.inputDigit(button.currentTitle!){
                    display(result: output)
                }
            }catch{
                display(result: "Err")
            }
            
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        calculator?.clear()
        display(result: "0")
    }
    
    public func display(result:String){
        resultScreen.text = result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculator = Calculator()
        
        // Set accessibility identifier for resultScreen
        resultScreen.accessibilityIdentifier = "resultScreen"
    }
    
}
