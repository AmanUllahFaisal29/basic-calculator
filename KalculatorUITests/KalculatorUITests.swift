//
//  VC Tests.swift
//  KalculatorTests
//
//  Created by maclab on 07/11/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//  Application Development in iOS Devices
//  Assignment 3
//  AmanUllah Faisal 22944


import XCTest

class KalculatorUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    //This is testingButtons in ViewController class
    func testButtonsAvailability() {
        let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        let operators = ["+", "-", "*", "/"]
        
        for number in numbers {
            XCTAssertTrue(app.buttons[number].exists, "Button \(number) is not available")
        }
        
        for op in operators {
            XCTAssertTrue(app.buttons[op].exists, "Operator button \(op) is not available")
        }
    }
    
    //This is testingDisplay in ViewController class
    func testOutputDisplay() {
        let digitButton = app.buttons["1"] // Assuming '1' is one of our digit buttons
        digitButton.tap()
        
        let resultLabel = app.staticTexts["resultScreen"]
        XCTAssertTrue(resultLabel.exists, "Result screen label is not available")
        XCTAssertEqual(resultLabel.label, "1", "Expected result is not displayed")
        
        let clearButton = app.buttons["C"] // Assuming 'C' is our clear button
        clearButton.tap()
        XCTAssertEqual(resultLabel.label, "0", "Clear button did not reset the result")
        
    }
}
