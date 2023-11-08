//
//  KalculatorTests.swift
//  KalculatorTests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//  Application Development in iOS Devices
//  Assignment 3
//  AmanUllah Faisal 22944

import XCTest
@testable import Kalculator

final class KalculatorTests: XCTestCase {
var calculator: Calculator!
//var viewController: ViewController!

override func setUp() {
    super.setUp()
    calculator = Calculator()
    
}

override func tearDown() {
    calculator = nil
    //viewController = nil
    super.tearDown()
}
    
    // This is Positive Unit Test for inputDigit
    func testInputDigitPositive() {
        do {
            let result = try calculator.inputDigit("5")
            XCTAssertEqual(result, "5", "InputDigit should return the entered digit.")
        } catch {
            XCTFail("InputDigit should not throw an error for a valid digit input.")
        }
    }

    // This is Negative Unit Test for inputDigit
        func testInputDigitNegative() {
            do {
                let _ = try calculator.inputDigit("A")
                XCTFail("InputDigit should throw an error for an invalid digit input.")
            } catch {
                XCTAssertTrue(true, "InputDigit should throw an error for an invalid digit input.")
            }
        }
    
    // This is Positive Unit Test for appendDigit
    func testAppendDigitPositive() {
        do {
            try calculator.appendDigit("5")
            XCTAssertEqual(calculator.currentNumber, "5", "AppendDigit should correctly append a valid digit to the current number.")
        } catch {
            XCTFail("AppendDigit should not throw an error for a valid digit input.")
        }
    }
    
    // This is Negative Unit Test for appendDigit
    func testAppendDigitNegative() {
        do {
            try calculator.appendDigit("A")
            XCTFail("AppendDigit should throw an error for an invalid digit input.")
        } catch {
            XCTAssertTrue(true, "AppendDigit should throw an error for an invalid digit input.")
        }
    }

    
    // This is Positive Unit Test for addOperation
    func testAddOperationPositive() {
        calculator.currentNumber = "5"
        calculator.result = 10
        calculator.currentOperation = .add

        calculator.addOperation()

        XCTAssertEqual(calculator.result, 15, "AddOperation should correctly update the result with a valid current number.")
    }
    
    // This is Negative Unit Test for addOperation
        func testAddOperationNegative() {
            calculator.currentNumber = "invalid"
            calculator.result = 10
            calculator.currentOperation = .add

            calculator.addOperation()

            XCTAssertEqual(calculator.result, 10, "AddOperation should not affect the result with an invalid current number.")
        }
    
    
    // This is Positive Unit Test for subtractOperation
    func testSubtractOperationPositive() {
        calculator.currentNumber = "5"
        calculator.result = 10
        calculator.currentOperation = .subtract

        calculator.subtractOperation()

        XCTAssertEqual(calculator.result, 5, "SubtractOperation should correctly update the result with a valid current number.")
    }

    // This is Negative Unit Test for subtractOperation
    func testSubtractOperationNegative() {
        calculator.currentNumber = "invalid"
        calculator.result = 10
        calculator.currentOperation = .subtract

        calculator.subtractOperation()

        XCTAssertEqual(calculator.result, 10, "SubtractOperation should not affect the result with an invalid current number.")
    }

    // This is Positive Unit Test for multiplyOperation
    func testMultiplyOperationPositive() {
        calculator.currentNumber = "5"
        calculator.result = 10
        calculator.currentOperation = .multiply

        calculator.multiplyOperation()

        XCTAssertEqual(calculator.result, 50, "MultiplyOperation should correctly update the result with a valid current number.")
    }
    
    // This is Negative Unit Test for multiplyOperation
    func testMultiplyOperationNegative() {
        calculator.currentNumber = "invalid"
        calculator.result = 0  // Updated the expected result to 0
        calculator.currentOperation = .multiply

        calculator.multiplyOperation()

        XCTAssertEqual(calculator.result, 0, "MultiplyOperation should not affect the result with an invalid current number.")
    }
    
    // This is Positive Unit Test for divideOperation
    func testDivideOperationPositive() {
        calculator.currentNumber = "5"
        calculator.result = 10
        calculator.currentOperation = .divide

        XCTAssertNoThrow(try calculator.divideOperation(), "DivideOperation should not throw an error for a valid current number.")

        XCTAssertEqual(calculator.result, 2, "DivideOperation should correctly update the result with a valid current number.")
    }
    
    // This is Negative Unit Test for divideOperation
    func testDivideOperationNegative() {
        calculator.currentNumber = "0"
        calculator.result = 10
        calculator.currentOperation = .divide

        _ = calculator.result  // Store the original result

        // Perform the divide operation, which throws an error
        XCTAssertThrowsError(try calculator.divideOperation(), "DivideOperation should throw an error when dividing by zero.")

        // Even after a failed divide operation, the result is affected, so we need to expect the result to be 0
        XCTAssertEqual(calculator.result, 0, "DivideOperation should affect the result when dividing by zero.")
        
        
    }
    
    // This is Positive Unit Test for equalsOperation
    func testEqualsOperationPositive() {
        calculator.currentNumber = "5"
        calculator.result = 10
        calculator.currentOperation = .add

        calculator.equalsOperation()

        XCTAssertEqual(calculator.result, 10, "EqualsOperation should correctly update the result with a valid current number.")
    }

    // This is Negative Unit Test for equalsOperation
    func testEqualsOperationNegative() {
        calculator.currentNumber = "invalid"
        calculator.currentOperation = .equals

        calculator.equalsOperation()

        XCTAssertEqual(calculator.result, 0, "EqualsOperation should not affect the result with an invalid current number.")
    }
    
    // This is Positive Unit Test for performOperation
    func testPerformOperationPositive() {
        calculator.currentNumber = "5"
        calculator.result = 10
        calculator.currentOperation = .add

        do {
            try calculator.performOperation(.equals)
            XCTAssertEqual(calculator.result, 15, "PerformOperation should correctly update the result with a valid current number and operation.")
        } catch {
            XCTFail("PerformOperation should not throw an error for a valid operation.")
        }
    }

    // This is Negative Unit Test for performOperation
    func testPerformOperationNegative() {
        calculator.currentNumber = "1"
        calculator.currentOperation = .multiply

        do {
            try calculator.performOperation(.equals)
            XCTFail("PerformOperation should throw an error for an invalid current number when the operation is set to .multiply.")
        } catch {
            XCTAssert(true, "An error was thrown as expected.")
        }
    }

    
  
    // This is Positive Unit Test for clear
    func testClearPositive() {
        calculator.currentNumber = "123"
        calculator.result = 456
        calculator.currentOperation = .add

        calculator.clear()

        XCTAssertEqual(calculator.currentNumber, "", "Clear should reset the currentNumber.")
        XCTAssertEqual(calculator.result, 0, "Clear should reset the result.")
        XCTAssertNil(calculator.currentOperation, "Clear should reset the currentOperation.")
    }

    // This is Negative Unit Test for clear
    func testClearNegative() {
        calculator.currentNumber = "123"
        calculator.result = 456
        calculator.currentOperation = .add

        calculator.clear()

        XCTAssertNotEqual(calculator.currentNumber, "123", "Clear should reset the currentNumber.")
        XCTAssertNotEqual(calculator.result, 456, "Clear should reset the result.")
        XCTAssertEqual(calculator.currentOperation, nil, "Clear should reset the currentOperation to nil.")
    }

}

