//
//  FooBarQixTests.swift
//  FooBarQixTests
//
//  Created by Badre DAHA BELGHITI on 04/09/2019.
//  Copyright © 2019 Badre DAHA BELGHITI. All rights reserved.
//

import XCTest
@testable import FooBarQix

class FooBarQixTests: XCTestCase {
    var sut: FooBarQix!
    
    override func setUp() {
        sut = FooBarQix()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    //**** Step1 *****//
    /* Rules
     If the number is divisible by 3, write “Foo” instead of the number
     If the number is divisible by 5, add “Bar”
     If the number is divisible by 7, add “Qix”
     For each digit 3, 5, 7, add “Foo”, “Bar”, “Qix” in the digits order.
     ****************/
    
    func test_if_number_is_divisible_by_3_with_One_as_input(){
        let res = sut.compute("1")
        XCTAssertEqual(res, "1")
    }
    func test_if_number_is_divisible_by_3_with_Two_as_input(){
        let res = sut.compute("2")
        XCTAssertEqual(res, "2")
    }
    
    func test_if_number_is_divisible_by_3_and_input_3(){
        let res = sut.compute("3")
        XCTAssertEqual(res, "FooFoo")
    }
    
    func test_if_number_is_divisible_by_3_and_input_9(){
        let res = sut.compute("9")
        XCTAssertEqual(res, "Foo")
    }
    
    func test_if_number_is_divisible_by_3_and_input_15(){
        let res = sut.compute("15")
        XCTAssertEqual(res, "FooBarBar")
    }
    
    
    func test_if_number_is_divisible_by_5(){
        let res = sut.compute("5")
        XCTAssertEqual(res, "BarBar")
    }
    
    func test_if_number_is_divisible_by_7(){
        let res = sut.compute("7")
        XCTAssertEqual(res, "QixQix")
    }
    
    func test_if_number_is_divisible_by_3_and_intput_33(){
        let res = sut.compute("33")
        XCTAssertEqual(res , "FooFooFoo")
    }
    
    func test_if_number_is_divisible_by_5_and_input_55(){
        let res = sut.compute("55")
        XCTAssertEqual(res , "BarBarBar")
    }
    
    func test_if_number_is_divisible_by_5_and_input_51(){
        let res = sut.compute("51")
        XCTAssertEqual(res , "FooBar")
    }
    
    func test_if_number_is_divisible_by_7_and_input_77(){
        let res = sut.compute("77")
        XCTAssertEqual(res , "QixQixQix")
    }
    
    //**** Step2 *****//
    /* Rules
      keep a trace of 0 in numbers, each 0 must be replace par char “*“.
     ****************/
    
    func test_if_trace_of_zero_in_number_with_101_as_input(){
        let digits = 101
        let res = sut.compute(String(digits))
        XCTAssertEqual(res , "1*1")
    }
    
    func test_if_trace_of_zero_in_number_with_303_as_input(){
        let digits = 303
        let res = sut.compute(String(digits))
        XCTAssertEqual(res , "FooFoo*Foo")
    }
    
    func test_if_trace_of_zero_in_number_with_10101_as_input(){
        let digits = 10101
        let res = sut.compute(String(digits))
        XCTAssertEqual(res , "FooQix**")
    }
    
    func test_if_trace_of_zero_in_number_with_multiple_of_divied(){
        let digits = 3*5*7
        let res = sut.compute(String(digits))
        XCTAssertEqual(res , "FooBarQix*Bar")
    }
    
}

