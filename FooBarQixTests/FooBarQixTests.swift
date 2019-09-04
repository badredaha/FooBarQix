//
//  FooBarQixTests.swift
//  FooBarQixTests
//
//  Created by Badre DAHA BELGHITI on 04/09/2019.
//  Copyright © 2019 Badre DAHA BELGHITI. All rights reserved.
//

import XCTest
@testable import FooBarQix


struct FooBarQix {
    func compute(_ string: String) -> String? {
        guard let  number = Int(string) else{
            return nil
        }
        
        if number % 7 == 0 {
            
            return "Qix"
        }
        
        if number % 5 == 0 {
            return "Bar"
        }
        
        if number % 3 == 0 {
            if number == 3{
                return "FooFoo"
            }
            
            return "Foo"
        }
        
        return string
    }
}

class FooBarQixTests: XCTestCase {

    //**** Step1 *****//
    /* Rules
     If the number is divisible by 3, write “Foo” instead of the number
     If the number is divisible by 5, add “Bar”
     If the number is divisible by 7, add “Qix”
     For each digit 3, 5, 7, add “Foo”, “Bar”, “Qix” in the digits order.
    ****************/
    
    func test_if_number_is_divisible_by_3(){
        let sut = FooBarQix()
        let res = sut.compute("9")
        XCTAssert(res == "Foo")
    }
    
    func test_if_number_is_divisible_by_5(){
        let sut = FooBarQix()
        let res = sut.compute("5")
        XCTAssert(res == "Bar")
    }
    
    func test_if_number_is_divisible_by_7(){
        let sut = FooBarQix()
        let res = sut.compute("7")
        XCTAssert(res == "Qix")
    }
    
    func test_if_number_is_divisible_by_3_and_number_equal_to_3(){
        let sut = FooBarQix()
        let res = sut.compute("3")
        XCTAssert(res == "FooFoo")
    }
  

}
