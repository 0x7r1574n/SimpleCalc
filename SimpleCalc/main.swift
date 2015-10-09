//
//  main.swift
//  SimpleCalc
//
//  Created by Cechi Shi on 10/6/15.
//  Copyright © 2015 University of Washington. All rights reserved.
//

import Foundation

// Gets user input as a string
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

// Converts a number in string format to a double
func convert(incoming:String) -> Double {
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
}

// Checks if a double is an integer
func isInteger(double:Double) -> Bool {
    return floor(double) == double
}

// Checks if a string is a number
func isNumber(incoming:String) -> Bool {
    return Int(incoming) != nil || Double(incoming) != nil
}

// Factorial calculation
func factorial(n:Int) -> Int {
    return n == 0 ? 1 : n * factorial(n - 1)
}

// Prints a number properly, removes trailing decimals for integer doubles
func printProperNumberType(double:Double) -> Void {
    if isInteger(double) {
        print("Result: \(Int(double))")
    } else {
        print("Result: \(double)")
    }
}

// Operations on two-operand calculations
func twoOperandCalculation(left:Double, right:Double, operation:String) {
    let result: Double?
    
    switch operation {
    case "+":
        result = left + right
    case "-":
        result = left - right
    case "*":
        result = left * right
    case "/":
        result = left / right
    case "%":
        result = left % right
    default:
        result = nil
    }
    
    if result != nil {
        printProperNumberType(result!)
    } else {
        print("Invalid opeartion.")
    }
}


// Prompt for user input
print("Enter an expression separated by returns:")

// Current input
var element: String
var inventory = [String]()

// Main logic for getting/storing the input
repeat {
    element = input()
    inventory.append(element)
} while (isNumber(element))

// If a valid or invalid opeartion is requested
switch element {
case "count":
    print("Result: \(inventory.count - 1)")
case "avg", "average":
    // Only if they have entered some numbers
    if inventory.count > 1 {
        var sum = convert(inventory[0])
        for var i = 1; i < inventory.count - 1; i++ {
            sum += convert(inventory[i])
        }
        let result = sum/Double(inventory.count - 1)
        printProperNumberType(result)
    } else {
        print("Missing operands.")
    }
case "fact", "factorial", "!":
    // Has to be one number
    let number = convert(inventory[0])
    // Recursion stack cap
    if inventory.count == 2 && number <= 20 {
        print("Result: \(factorial(Int(number)))")
    }
    else if number > 20 {
        print("Number too large, enter a number <= 20.")
    }
    else {
        print("Too many numbers.")
    }
    // two-operand calculations
case "+", "-", "*", "/", "%":
    // Saves second part of the expression
    let secondPart = input()
    twoOperandCalculation(convert(inventory[0]), right: convert(secondPart), operation: inventory[1])
default:
    print("Invalid operation.")
}

