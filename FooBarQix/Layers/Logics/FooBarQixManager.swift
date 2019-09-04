//
//  FooBarQix.swift
//  FooBarQix
//
//  Created by Badre DAHA BELGHITI on 04/09/2019.
//  Copyright © 2019 Badre DAHA BELGHITI. All rights reserved.
//

import Foundation

enum ValueEnum{
    case foo
    case bar
    case qix
}
extension ValueEnum: CaseIterable{
    func getValue()-> String{
        switch self {
        case .foo:
            return "Foo"
        case .bar:
            return "Bar"
        case .qix:
            return "Qix"
        }
    }
}

struct FooBarQix {
    
    let fooDivisor = 3
    let barDivisor = 5
    let qixDivisor = 7
    
    func compute(_ string: String) -> String {
        // -1 if string is not a number
        guard string.number != -1 else{
            return string
        }
        let number = string.number
        var result = ""
        
        if (!isNumberDivided(string.number)){
            if let str = self.mappingNumberNotDivided(string){
                result.append(str)
            }
            return result
        }
        
        if number % fooDivisor == 0 {
            result.append(ValueEnum.foo.getValue())
        }
        
        if number % barDivisor == 0 {
            result.append(ValueEnum.bar.getValue())
        }
        
        if number % qixDivisor == 0 {
            result.append(ValueEnum.qix.getValue())
        }
        
        if let str = self.mappingOfGivenNumber(string){
            result.append(str)
        }
        
        return result
    }
}

extension FooBarQix{
    private func isNumberDivided(_ number: Int) -> Bool{
        if (number % fooDivisor == 0) || (number % barDivisor == 0) || (number % qixDivisor == 0) {
            return true
        }
        return false
    }
    
    private func mappingOfGivenNumber(_ stringNumber: String) -> String? {
        let mappingStr = stringNumber.map { (c) -> String in
            var mapStr = ""
            switch c{
            case "3":
                mapStr.append(ValueEnum.foo.getValue())
            case "5":
                mapStr.append(ValueEnum.bar.getValue())
            case "7":
                mapStr.append(ValueEnum.qix.getValue())
            case "0":
                //TODO: Refacto /!\ Not in domain of FooBarQix ! just new rule of new business request
                mapStr.append("*")
            default:
                break
            }
            return mapStr }
            .compactMap{$0}
            .joined()
        
        
        return !mappingStr.isEmpty ? mappingStr : nil
    }
    
    private func mappingNumberNotDivided(_ stringNumber: String) -> String? {
        let mappingStr = stringNumber.map { (c) -> String in
            var mapStr = ""
            switch c{
            case "0":
                mapStr.append("*")
            default:
                mapStr.append(c)
                break
            }
            return mapStr }
            .compactMap{$0}
            .joined()
        
        
        return !mappingStr.isEmpty ? mappingStr : nil
    }
}

extension String{
    var number: Int{
        if let nbr = Int(self){
            return nbr
        }
        return -1
    }
}

