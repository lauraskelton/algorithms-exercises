//
//  StoreCredit.swift
//  
//
//  Created by Laura Skelton on 7/18/14.
//
// To run in the terminal:
//  /Applications/Xcode6-Beta3.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -i StoreCredit.swift

import Foundation

//import UIKit


let path = "/Users/lauraskelton/Documents/A-large-practice.in.txt"



//reading
var text : String! = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)

println("output")

let inputData : [NSString] = text.componentsSeparatedByString("\n")

var i : Int = 0
var creditArray : [NSInteger] = []
var itemsArray : [[NSInteger]] = []

let totalTests : Int = inputData[0].integerValue()
for element:NSString in inputData {
    if i == 0  {
        i += 1
        continue
    }
    if i == totalTests * 3 + 1 {
        break
    }
    switch (i-1) % 3 {
    case 0:
        // it is the store credit
        creditArray.append(element.integerValue())
        break
    case 1:
        // it is the count of items
        break
    case 2:
        // it is the array of items
        let tmpArray: [NSString] = element.componentsSeparatedByString(" ") as [NSString]
        var newTmpArray: [NSInteger] = []
        for el in tmpArray {
            newTmpArray.append(el.integerValue())
        }
        itemsArray.append(newTmpArray)
        break
    default:
        break
    }
    
    i += 1
}

func saveValues(items:[NSInteger]) -> [NSInteger: [Int]] {
    var keysDictionary : [NSInteger: [Int]] = [:]
    
    var i : Int = 0
    for anItem in items {
        if let existingItem = keysDictionary[anItem] {
            var tmpArray : [Int] = existingItem
            tmpArray.append(i)
            keysDictionary[anItem] = tmpArray
        } else {
            keysDictionary[anItem] = [i]
        }
        i += 1
    }
    return keysDictionary
}

func findMatches(items:[NSInteger], keysDictionary:[NSInteger: [Int]], credit: NSInteger) -> (Int, Int)? {
    
    for anItem in items {
        
        let pairMatch : NSInteger = credit - anItem
        if let pairMatchPositions = keysDictionary[pairMatch] {
            // found a match
            if pairMatch == anItem {
                if pairMatchPositions.count < 2 {
                    continue
                }
                return (pairMatchPositions[0], pairMatchPositions[1])
            }
            return (keysDictionary[anItem]![0], pairMatchPositions[0])
        }
    }
    return nil
}

func findAnswer(credit:NSInteger, items:[NSInteger]) -> (Int, Int)? {
    return findMatches(items, saveValues(items), credit)
}

var answer : [(Int, Int)] = []
for i: Int in 0..<totalTests {
    answer.append(findAnswer(creditArray[i], itemsArray[i])!)
}


func twoTupleToString(inputTuple:(NSInteger, NSInteger)) -> NSString {
    return "\(inputTuple.0 + 1) \(inputTuple.1 + 1)"
}

let stringArray = answer.map(twoTupleToString)

var outputString : String = ""

var caseNum : Int = 1
for tupleString in stringArray {
    outputString += "Case #\(caseNum): \(tupleString)\n"
    caseNum += 1
}

let pathAnswer = "/Users/lauraskelton/Documents/testlarge.txt"


//writing
outputString.writeToFile(pathAnswer, atomically: false, encoding: NSUTF8StringEncoding, error: nil)