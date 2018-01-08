//
//  AlgorithmsAnalysis.swift
//  ILearnCpp
//
//  Created by sanooj on 10/8/17.
//  Copyright © 2017 DCore. All rights reserved.
//

import Foundation

public class AlgorithmsAnalysis
{
    
}


//MARK: SymantecQuestions

typealias SymantecOnlineTest = AlgorithmsAnalysis
public extension SymantecOnlineTest
{
    //MARK: Q1
    
    public class func getStringAsArrayOfStrings(inputString:String) ->[String]
    {
        return inputString.characters.map { (char:Character) -> String in
            return String.init(char)
        }
    }
    
    public class func substringToOrFromIndexAltImp(inputString:String,index:Int,isFrom:Bool) -> String
    {
        let arrayOfString: [String] =
            getStringAsArrayOfStrings(inputString: inputString)
        
        let toOrForIndex:Int = index
        
        return arrayOfString.indices.filter({ (index:Int) -> Bool in
            if isFrom
            {
                return toOrForIndex >= index
            }
            else
            {
                return toOrForIndex <= index
            }
            
        }).map({ (index:Int) -> String in
            return arrayOfString[index]
        }).joined(separator: "")
    }
    
    public class func getAllSubStringsFrom(inputString:String)
    {
        //Logic
        /*
         genrate strings
         etc
         
         abcdefg
         abcdef
         abcde
         abcd
         abc
         ab
         a
         
         bcdefg
         bcdef
         bcde
         bcd
         bc
         b
         
         cdefg
         cdef
         cde
         cd
         c
         
         defg
         def
         de
         d
         
         efg
         ef
         e
        
         fg
         f
         
         g
         
         */
        var subStrings:[String] = []
        
        for (index) in inputString.characters.indices
        {
            let substringToIndex:String =
            inputString.substring(to: index)
            
            subStrings.append(substringToIndex)
        }
        
    }
    
    
    
}


//MARK:UNUSED
extension AlgorithmsAnalysis
{
    //get all possible substrings from a string
    public class func getAllSubStrings(inputString:String)
    {
        
        var subStrings:[String] = []
        for index in 0..<inputString.characters.count
        {
            let currentIndex:String.Index =
                inputString.index(
                    inputString.startIndex,
                    offsetBy: index,
                    limitedBy: inputString.endIndex
                    ) ?? inputString.startIndex
            
            let subStringToIndex:String =
                inputString.substring(to: currentIndex)
            
            
        }
    }
    
    public class func subStringOf(
        inputString:String,
        fromIndex currentIndex:String.Index
        )
    {
        
        let distanceFromIndex:String.CharacterView.IndexDistance =
            inputString.distance(
                from: inputString.startIndex,
                to: currentIndex
        )
        
        let currentIndex:String.Index =
            inputString.index(
                inputString.startIndex,
                offsetBy: distanceFromIndex,
                limitedBy: inputString.endIndex
                ) ?? inputString.startIndex
        
        
        let subStringTouse:String =
            inputString.substring(
                with: Range<String.Index>.init(
                    uncheckedBounds: (lower: currentIndex, upper: inputString.endIndex)
                )
        )
        
        var subStrings:[String] = []
        for char in subStringTouse.characters
        {
            if String(char).isEmpty
            {
                subStrings.append(String(char))
            }
            
        }
        
        print(subStrings)
        
        
        //        var str = "All this happened, more or less."
        //        let afterSpace = str.withMutableCharacters { chars -> String.CharacterView in
        //            if let i = chars.index(of: " ") {
        //                let result = chars.suffix(from: chars.index(after: i))
        //                chars.removeSubrange(i..<chars.endIndex)
        //                return result
        //            }
        //            return String.CharacterView()
        //        }
        
        
    }

}
