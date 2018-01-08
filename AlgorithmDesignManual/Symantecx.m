//
//  Symantecx.m
//  ILearnCpp
//
//  Created by sanooj on 10/7/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import "Symantecx.h"

@interface SubString:NSObject
@property (nonatomic,copy) NSString* subString;
@property (nonatomic,copy) NSString* parentString;
@property (nonatomic) NSRange subStringRange;
@end

@implementation SubString
@end

NSMutableArray<SubString*>* subStringObjects = nil;

@implementation Symantecx
NSArray<NSString*>* generateSubstringsViaForwardTraveral(NSString* string)
{
    NSString* stringToUse =
    [string copy];
    
    NSMutableArray* subStrings =
    [@[] mutableCopy];
    
    for (NSInteger index = 0 ; index <= stringToUse.length; index++)
    {
        NSString* subString =
        //[stringToUse substringToIndex:index];
        substringToIndexAltImp(stringToUse, index);
        
        if (subString.length > 0)
        {
            [subStrings addObject:subString];
        }
        
    }
    
    return [subStrings copy];
}

NSArray<NSString*>* generateSubstringsViaReverseTraveral(NSString* string)
{
    NSString* stringToUse =
    [string copy];
    
    NSMutableArray* subStrings =
    [@[] mutableCopy];
    
    for (NSInteger index = stringToUse.length ; index >= 0; index--)
    {
        NSString* subString =
        //[stringToUse substringToIndex:index];
        substringToIndexAltImp(stringToUse, index);
        
        if (subString.length > 0)
        {
            [subStrings addObject:subString];
        }
    }
    
    return [subStrings copy];
}


//ie. ssubstring to the index provided
NSString* substringToIndexAltImp(NSString* string,NSInteger toIndex) {
    NSString* stringToUse =
    [string copy];
    
    NSMutableArray* subStrings =
    [@[] mutableCopy];
    
    for (NSInteger index = 0 ; index < toIndex; index++)
    {
        NSString* subString =
        [stringToUse substringWithRange:NSMakeRange(index, 1)];
        
        if (subString.length > 0)
        {
            [subStrings addObject:subString];
        }

    }
    
    return [[subStrings componentsJoinedByString:@""] copy];
}


//ie. ssubstring from the index provided to end of string
NSString* substringFromIndexAltImp(NSString* string,NSInteger fromIndex) {
    NSString* stringToUse =
    [string copy];
    
    NSMutableArray* subStrings =
    [@[] mutableCopy];
    
    for (NSInteger index = fromIndex ; index < string.length ; index++)
    {
        NSString* subString =
        [stringToUse substringWithRange:NSMakeRange(index, 1)];
        
        if (subString.length > 0)
        {
            [subStrings addObject:subString];
        }
    }
    
    return [[subStrings componentsJoinedByString:@""] copy] ;
}


NSArray<NSString*>* getAllSubstringsFromString(NSString* string)
{
    NSString* stringToUse =
    string.length > 0 ? string : @"kincenvizh";
    
    NSMutableArray<NSString*>* subStrings =
    [@[] mutableCopy];
    
    for (NSInteger index = 0 ; index <= stringToUse.length; index++)
    {
        //elimitaion
        NSString* subString =
        //[stringToUse substringFromIndex:index];
        substringFromIndexAltImp(stringToUse, index);
        //substringToIndexAltImp(stringToUse, index);
        
        if (subString.length > 0)
        {
            NSArray<NSString*>* substrings =
            generateSubstringsViaForwardTraveral(subString);
            
            [subStrings addObjectsFromArray:substrings];
        }
        
    }

    [subStrings sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString* lhs = (NSString*)obj1;
        NSString* rhs = (NSString*)obj2;
        
        
        if (lhs.length == rhs.length) {
            return NSOrderedSame;
        }
        
        if (lhs.length > rhs.length) {
            return NSOrderedDescending;
        }
        
        if (lhs.length < rhs.length) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }

    }];
    
    NSOrderedSet<NSString*>* uniqueSubstrings =
    [[NSOrderedSet<NSString*> alloc]initWithArray:subStrings] ;
    
    NSLog(@"countOfStrings %lu",(unsigned long)[uniqueSubstrings count]);
    
    //NSLog(@"countOfStrings %lu",(unsigned long)[subStrings count]);
    
    return [uniqueSubstrings array];
    
    return subStrings;
}

void sortWordsBasedSizeAndCapitalizeFirstWord(NSString* sentense) {
    NSString* string = sentense.lowercaseString;
    
    //strip period
    string = [[string copy] stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    //split the sentense into words
    NSArray<NSString *> * stringArrayofWords =
    [string componentsSeparatedByString:@" "];
    
    NSMutableArray<NSString *> * sortedArray =
    [[[stringArrayofWords copy] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        
        NSString* lhs = (NSString*)obj1;
        NSString* rhs = (NSString*)obj2;
        
        
        if (lhs.length == rhs.length)
        {
            return NSOrderedSame;
        }
        
        if (lhs.length > rhs.length)
        {
            return NSOrderedDescending;
        }
        
        if (lhs.length < rhs.length)
        {
            return NSOrderedAscending;
        }
        else
        {
            return NSOrderedSame;
        }
        
    }] mutableCopy];
    
    //append period to last element
    if (sortedArray.count > 0) {
        
        NSString* lastobject =
        [[sortedArray lastObject] stringByAppendingString:@"."];
        
        [sortedArray removeLastObject];
        
        [sortedArray addObject:lastobject];
        
        //capitalize first element
        sortedArray[0] = sortedArray[0].capitalizedString;
        
    }
    
    NSLog(@"%@",[sortedArray componentsJoinedByString:@" "]);
}


// findMinimumNumberOfCharactersToBeRemovedToMakeAStringAnAnagramOfAnother

NSString* reverseString(NSString* stringTobeReverse) {
    
    NSMutableArray<NSString*>* __block chars =
    [@[] mutableCopy];
    
    [stringTobeReverse enumerateSubstringsInRange:NSMakeRange(0, [stringTobeReverse length])
                                          options:NSStringEnumerationByComposedCharacterSequences
     | NSStringEnumerationReverse
                                       usingBlock:
     ^(NSString * _Nullable substring,
       NSRange substringRange,
       NSRange enclosingRange,
       BOOL * _Nonnull stop)
    {
        [chars addObject:substring];
                                           
    }];
    
    return [chars componentsJoinedByString:@""];
}

 NSArray<NSString*>* getCharacters(NSString* stringTobeReverse) {
    
    NSMutableArray<NSString*>* __block chars =
    [@[] mutableCopy];
    
    [stringTobeReverse enumerateSubstringsInRange:NSMakeRange(0, [stringTobeReverse length])
                                          options:NSStringEnumerationByComposedCharacterSequences
                                       usingBlock:
     ^(NSString * _Nullable substring,
       NSRange substringRange,
       NSRange enclosingRange,
       BOOL * _Nonnull stop)
     {
         [chars addObject:substring];
         
     }];
    
     return [chars copy];
}


bool areTwoStringsEqual(NSString* firstString, NSString* secondString)
{
    if ([firstString length] == [secondString length])
    {
        NSInteger equalCharactersCount = 0;
        
        NSArray<NSString*>* charsOfFirstString =
        getCharacters(firstString);
        
        NSArray<NSString*>* charsOfSecondStringReverse =
        getCharacters(secondString);
        
        for (NSInteger index = 0; index < secondString.length; index++) {
            
            if ([charsOfFirstString[0] isEqualToString:charsOfSecondStringReverse[0]])
            {
                equalCharactersCount++;
            }
        }
        
        if (equalCharactersCount == secondString.length )
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}


bool isAnAnagram(NSString* firstString, NSString* secondString)
{
    //check if they are of equal length
    if ([firstString length] == [secondString length])
    {
        NSString* reversedString =
        reverseString(secondString);
        
        if ([firstString isEqualToString:reversedString])
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}


NSArray<NSString*>* reversedElementsArray(NSArray<NSString*>* array)
{
    NSMutableArray<NSString*>* reversed =
    [@[] mutableCopy];
    
    for (NSString* element in array)
    {
        [reversed addObject:reverseString(element)];
    }
    
    return [reversed copy];
}

NSNumber* getAllAnagarams(NSString* firstString, NSString* secondString)
{
   // if ([firstString length] == [secondString length])
    //{
        //bool areAnagrams =
        //isAnAnagram(firstString, secondString);
    //}
    //else
    {
        //find the longer string
        NSString* longerString =
        firstString.length >= secondString.length ? firstString : secondString;
        
        NSString* shorterString =
        firstString.length <= secondString.length ? firstString : secondString;
        
        //get all substrings for longerString
        NSArray<NSString*>* subStrings =
        getAllSubstringsFromString(longerString);
        
        NSArray<NSString*>* subStringsReversedFromShortherString =
        reversedElementsArray(
        getAllSubstringsFromString(shorterString)
                              );
        
        //loop through looking for anagrams
        NSMutableArray<NSString*>* anagrams =
        [@[] mutableCopy];
        
        for (NSString* element in subStrings)
        {
            NSString* reversedElement =
            reverseString(element);
            
            if (isAnAnagram(shorterString, reversedElement))
            {
                [anagrams addObject:element];
            }
        }
        
        
        // get all substrings common between subStringsFromLongersString and subStringsReversedFromShortherString
        
        NSMutableArray<NSString*>* anagramsAfterComparingSubstrings =
        [@[] mutableCopy];
        
        for (NSString* elementFromLongString in subStrings)
        {
            for (NSString* elementFromShorterString in subStringsReversedFromShortherString)
            {
                NSString* reversedElement =
                reverseString(elementFromShorterString);
                
                if ([elementFromLongString isEqualToString:elementFromShorterString])
                {
                    [anagramsAfterComparingSubstrings addObject:elementFromLongString];
                }

            }
            
            
        }
        
        //lets find common elements
        NSOrderedSet<NSString*>* setForLongStringSubStrings =
        [[NSOrderedSet<NSString*> alloc] initWithArray:subStrings];
        
        NSOrderedSet<NSString*>* setForShortStringSubStrings =
        [[NSOrderedSet<NSString*> alloc] initWithArray:subStringsReversedFromShortherString];
        
        //intersect
        NSMutableOrderedSet<NSString*>* __setForLongStringSubStrings =
        [setForLongStringSubStrings mutableCopy];
        
        [__setForLongStringSubStrings intersectOrderedSet:setForShortStringSubStrings];
        
        NSInteger fromFirstString =
        firstString.length - [[anagramsAfterComparingSubstrings lastObject] length];
        
        NSInteger fromSecondString =
        secondString.length - [[anagramsAfterComparingSubstrings lastObject] length];
        
        NSLog(@"NumberOfElemnstToberemoved from FirstString %lu",
              firstString.length - [[anagramsAfterComparingSubstrings lastObject] length]
               );
        
        NSLog(@"NumberOfElemnstToberemoved from Second %lu",
              secondString.length - [[anagramsAfterComparingSubstrings lastObject] length]
              );
        
        
        
        
        
        return [NSNumber numberWithInteger:(fromFirstString + fromSecondString)];
    }
 
}


void minNumberWorkingSample(NSString* longerString, NSString* shorterString)
{
    NSMutableDictionary<NSString*,NSNumber*>* hashForLong =
    [@{} mutableCopy];
    
    NSMutableDictionary<NSString*,NSNumber*>* hashForShort =
    [@{} mutableCopy];
    
    for (NSString* element in getCharacters(longerString)) {
        
        NSNumber* countFor1 =
        hashForLong[element];
        
        if (countFor1 == nil)
        {
            hashForLong[element] = @1;
        }
        else
        {
            hashForLong[element] = [[NSNumber alloc] initWithInt:(countFor1.intValue + 1)];
        }
    }
    
    for (NSString* element in getCharacters(shorterString)) {
        
        NSNumber* countFor1 =
        hashForShort[element];
        
        if (countFor1 == nil)
        {
            hashForShort[element] = @1;
        }
        else
        {
            hashForShort[element] = [[NSNumber alloc] initWithInt:(countFor1.intValue + 1)];
        }
    }
    
    int count = 0;
    
    for (NSString*element in getCharacters(@"abcdefghijklmnopqrstuvwxyz"))
    {
        NSNumber* value1 =
        hashForLong[element] != nil ? hashForLong[element] : @0 ;
        
        NSNumber* value2 =
        hashForShort[element] != nil ? hashForShort[element] : @0 ;
        
        count += abs(value1.intValue - value2.intValue);
    }

}

@end


@interface Symantecx (SecondRound)

@end


@implementation Symantecx (SecondRound)



@end

