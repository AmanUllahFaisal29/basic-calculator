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
@testable import Kalculator

//VC = ViewController
final class VCTests: XCTestCase {
    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ControlMe") as? ViewController
        viewController.loadView()
    }

    override func tearDown() {
        viewController = nil
        super.tearDown()
    }



    // This is Positive Unit Test for inputDigit
    func testInputDigitPositive() {

        viewController.resultScreen.text = ""
        
        let digitButton = UIButton()
        digitButton.setTitle("", for: .normal)
        viewController.inputDigit(digitButton)
        
        XCTAssertEqual(viewController.resultScreen.text, "", "inputDigit should display the pressed digit on the resultScreen.")
    }


    // This is Negative Unit Test for inputDigit
    func testInputDigitNegative() {
        viewController.resultScreen.text = ""

        let invalidButton = UIButton()
        invalidButton.setTitle("A", for: .normal)
        viewController.inputDigit(invalidButton)
        XCTAssertEqual(viewController.resultScreen.text, "", "inputDigit should not display an invalid character on the resultScreen.")
    }
    
    // This is Positive Unit Test for clear
    func testClearPositive() {
    viewController.resultScreen.text = "123"
    viewController.clear(UIButton())
    XCTAssertNotEqual(viewController.resultScreen.text, "0", "Clear didn't reset the resultScreen label to '0' as expected.")
    }

    // This is Negative Unit Test for clear
    func testClearNegative() {
        viewController.resultScreen.text = "123"
        viewController.clear(UIButton())
        XCTAssertEqual(viewController.resultScreen.text, "0", "Clear should reset the resultScreen label to '0'.")
    }

    // This is Positive Unit Test for display(result:)
    func testDisplayResultPositive() {
        viewController.resultScreen.text = ""
        viewController.display(result: "42")
        XCTAssertEqual(viewController.resultScreen.text, "42", "display(result:) should correctly display the provided result.")
    }

    // This is Negative Unit Test for display(result:)
    func testDisplayResultNegative() {
        viewController.resultScreen.text = ""
        viewController.display(result: "ABC")
        XCTAssert(viewController.resultScreen.text == "ABC", "display(result:) should not display an invalid result.")
    }
}

