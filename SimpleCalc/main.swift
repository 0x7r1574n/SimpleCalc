//
//  main.swift
//  SimpleCalc
//
//  Created by Cechi Shi on 10/6/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//


// Todo: check input string

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Double {
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
    
}

func singleOperation(firstPart:Double, secondPart:Double, operation:String) {
    let result: Double?
    
    switch operation {
    case "+":
        result = firstPart + secondPart
    case "-":
        result = firstPart - secondPart
    case "*":
        result = firstPart * secondPart
    case "/":
        result = firstPart / secondPart
    case "%":
        result = firstPart % secondPart
    default:
        result = nil
    }
    
    if result != nil {
        print("Result: \(result!)")
    } else {
        print("Invalid operation.")
    }
}



print("Enter an expression separated by returns:")

var firstPart = convert(input())
var operation = input()
var secondPart = convert(input())
singleOperation(firstPart, secondPart: secondPart, operation: operation)