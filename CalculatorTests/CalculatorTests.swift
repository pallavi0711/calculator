//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Admin on 12/03/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var viewController:ViewController!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        viewController = sb.instantiateInitialViewController() as! ViewController
    
    }
    
    func testDigit() {
       viewController.touchDigit(viewController.view.viewWithTag(6) as! UIButton)
        viewController.touchDigit(viewController.view.viewWithTag(9) as! UIButton)
        XCTAssertEqual(viewController.display.text!, "69")
    }
    
    func testConstantOperation()
    {
        viewController.performOperation(viewController.view.viewWithTag(14) as! UIButton)
        XCTAssertEqual(viewController.display.text!,"3.14159265358979")
        
    }
    
    func testUnaryOperation()
    {
        viewController.touchDigit(viewController.view.viewWithTag(9) as! UIButton)
        viewController.performOperation(viewController.view.viewWithTag(15) as! UIButton)
        XCTAssertEqual(viewController.display.text!,"3.0")
    }

    func testBinaryOperation()
    {
        viewController.touchDigit(viewController.view.viewWithTag(4) as! UIButton)
        viewController.performOperation(viewController.view.viewWithTag(10) as! UIButton)
        viewController.touchDigit(viewController.view.viewWithTag(8) as! UIButton)
        viewController.performOperation(viewController.view.viewWithTag(20) as! UIButton)
        XCTAssertEqual(viewController.display.text!, "32.0")
    }
}
