//: Playground - noun: a place where people can play

import Cocoa

//var str = "Hello, playground"
func subStringOf(
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

func getAllSubStrings(inputString:String)
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
        
        if !subStringToIndex.isEmpty
        {
            subStrings.append(subStringToIndex)
        }
        
    }
    
    print(subStrings)
}


 func getAllSubStringsFrom(inputString:String) -> [String]
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
            inputString.substring(from: index)
        
        print(index)
        
        if !substringToIndex.isEmpty
        {
            subStrings.append(substringToIndex)
        }
        
    }
    
    //print(subStrings)
    
    return subStrings
}

func getAllPossibleSubStrings(inputString: String = "kincenvizh")
{
    var subStrings:[String] = []
    
    for (index) in inputString.characters.indices
    {
        let substringToIndex:String =
            inputString.substring(to: index)
        
        if !substringToIndex.isEmpty
        {
            let subStringsA: [String] =
            getAllSubStringsFrom(inputString: substringToIndex)
            
            subStrings.append(contentsOf: subStringsA)
        }

    }
    
    let setOfSubstrings:Set<String> =
        Set<String>.init(subStrings)
    
    let sortedSet =
    setOfSubstrings.sorted { (lhs:String, rhs:String) -> Bool in
        return (lhs.characters.count < rhs.characters.count)
    }
    
    //print(sortedSet)
    
    for element in sortedSet {
        //print(element)
    }
    
    
    //print(setOfSubstrings.count)
}


//getAllSubStrings(inputString: "kincenvizh")

//subStringOf(inputString: "kincenvizh", fromIndex: "kincenvizh".startIndex)


//getAllSubStringsFrom(inputString: "kincenvizh")

getAllPossibleSubStrings()


//ransom note

func ransomNoteCheck(magazine:String, ransom:String)
{
    var magazineHash:[String:Int] = [:]
    var ransomHash:[String:Int] = [:]
    
    magazine.components(separatedBy: CharacterSet.whitespaces).forEach
        { (substring:String) in
        
        let magazineHashCount:Int =
        (magazineHash[substring] ?? 0)
        
        magazineHash[substring] = magazineHashCount + 1;
    }
    
    ransom.components(separatedBy: CharacterSet.whitespaces).forEach
        { (substring:String) in
        
        let ransomHashCount:Int =
            (ransomHash[substring] ?? 0)
        
        ransomHash[substring] = ransomHashCount + 1;
    }
    
    var wordCount:Int = 0
    var wordCountMagazine:Int = 0
    var wordCountRansom:Int = 0
   
    ransomHash.forEach { (hashTuple:(key: String, value: Int)) in
        
        wordCountMagazine += magazineHash[hashTuple.key] ?? 0
        wordCountRansom   += ransomHash[hashTuple.key] ?? 0
        
        if wordCountMagazine == wordCountRansom
        {
            wordCount+=1
        }
        
    }
    
    print(wordCount == wordCountRansom ? "YES" : "NO")
}


ransomNoteCheck(magazine: "give me one grand today night", ransom: "give one grand today")


