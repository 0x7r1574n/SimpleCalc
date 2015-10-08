//
//  main.swift
//  SimpleCalc
//
//  Created by Cechi Shi on 10/6/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}


func singleOperation(firstPart:Int, secondPart:Int, operation:String) {
    let result: Int?
    
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
        print("Invalid opeartion.")
    }
}

func isNumber(incoming:String) -> Bool {
    return Int(incoming) != nil || Double(incoming) != nil
}

func factorial(n:Int) -> Int {
    return n == 0 ? 1 : n * factorial(n - 1)
}


// Prompt for user input
print("Enter an expression separated by returns:")

// Current input
var element: String
var inventory = [String]()

// Supported operations
let operations = ["count", "fact", "avg", "+", "-", "*", "/", "%"]

repeat {
    element = input()
    inventory.append(element)
} while (isNumber(element))

// If a valid or invalid opeartion is requested
switch element {
    case "count":
        print("Result: \(inventory.count - 1)")
    case "avg":
        // Only if they have entered some numbers
        if inventory.count > 1 {
            var sum = convert(inventory[0])
            for var i = 1; i < inventory.count - 1; i++ {
                sum += convert(inventory[i])
            }
            print("Result: \(sum/(inventory.count - 1))")
        } else {
            print("Missing operands.")
        }
    case "fact":
        // Has to be one number
        if inventory.count == 2 {
            print("Result: \(factorial(convert(inventory[0])))")
        } else {
            print("Too many numbers.")
        }
    case "+", "-", "*", "/", "%":
        // Saves second part of the expression
        var secondPart = input()
        singleOperation(convert(inventory[0]), secondPart: convert(secondPart), operation: inventory[1])
    default:
        print("Invalid operation.")
}

