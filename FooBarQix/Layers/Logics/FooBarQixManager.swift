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
    
    let fooDivided = 3
    let barDivided = 5
    let qixDivided = 7
    
    func compute(_ string: String) -> String {
        // -1 if string is not a number
        guard string.number != -1 else{
            return string
        }
        
        let number = string.number
        var result = ""
        
        if number % fooDivided == 0 {
            result.append(ValueEnum.foo.getValue())
        }
        
        if number % barDivided == 0 {
            result.append(ValueEnum.bar.getValue())
        }
        
        if number % qixDivided == 0 {
            result.append(ValueEnum.qix.getValue())
        }
        
        if let str = self.mappingOfGivenNumber(string){
            result.append(str)
        }
        
        if !result.isEmpty{
            return result
        }
        return string
    }
}

extension FooBarQix{
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
            return mapStr
            }.compactMap{$0}.joined()
        
        
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

