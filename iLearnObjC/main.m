//
//  main.m
//  iLearnObjC
//
//  Created by sanooj on 10/5/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import <Foundation/Foundation.h>

//convert and it array to NSnumber array

BOOL isAnagram(NSString* stringA,
               NSString* stringB);

NSNumber* numberOfCharactersToBeDeletedToFormAnAnagram(
                                                       NSString* stringA,
                                                       NSString* stringB
                                                       );
NSString* reverseAString(NSString* inputString);

NSNumber* __numberOfCharactersToBeDeletedToFormAnAnagram(
                                                         NSString* stringA,
                                                         NSString* stringB
                                                         );

NSArray<NSString*>* getAllCombinationsOfString(NSString* inputString);

void leftShiftArray(){
    int n;
    int k;
    scanf("%i %i",&n,&k);
    int a[n];
    
    for(int a_i = 0; a_i < n; a_i++){
        scanf("%d",&a[a_i]);
    }
    
    typedef NSArray* (^ArrayGenToLimit)(NSNumber*);
    typedef NSArray<NSNumber*>* (^ArrayGen)(int[],int);
    
    ArrayGenToLimit newArray =
    ^ NSArray* (NSNumber* limit) {
        
        NSMutableArray<NSNumber*>* startingArray = [@[] mutableCopy];
        
        for (int i = 1; i <= limit.intValue; i ++) {
            [startingArray addObject:[[NSNumber alloc] initWithInt:i]];
        }
        
        return [startingArray copy];
    };
    
    ArrayGen newArrayFromArray =
    ^ NSArray<NSNumber*>* (int array[],int limit) {
        
        NSMutableArray<NSNumber*>* startingArray = [@[] mutableCopy];
        
        for (int i = 0; i < limit; i ++) {
            [startingArray addObject:[[NSNumber alloc] initWithInt:array[i]]];
        }
        
        return [startingArray copy];
    };
    
    //NSArray<NSNumber*>* startingArry = newArray([[NSNumber alloc] initWithInt:n]);
    NSArray<NSNumber*>* startingArry = newArrayFromArray(a,n);
    
    NSMutableArray<NSNumber*>* tmpArry = nil;
    
    const int numberOfRotations = k;
    
    
    
    /*
     if index == count of array
     move it to zero
     index 0 move to last index
     
     */
    tmpArry = [startingArry mutableCopy];
    
    for (int i = 0; i < numberOfRotations; i++) {
        //swap zero and last index
        
        NSNumber* __block tmpHolder = 0;
        //enumerate tmpArray
        [[tmpArry copy ] enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            
            
            if (idx == 0) {
                
                //move 0th index to last
                //keep hold of it until last
                //will swap it last
                tmpHolder = tmpArry[0];
                
                
            } else {
                //move all idx > 0
                //one index to left .. ie. index = currentIndex - 1
                tmpArry[idx-1]  = tmpArry[idx];
                
            }
            
        }];
        
        //update last index with the object at index = 0
        tmpArry[tmpArry.count - 1] = tmpHolder;
        
    }
    
    NSLog(@"%@", tmpArry);

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    //leftShiftArray()
    
    NSLog(@"%hhd",isAnagram(@"abc", @"cba"));
    
    reverseAString(@"abraka");
    
    __numberOfCharactersToBeDeletedToFormAnAnagram(@"abcd", @"cba");
    
    //numberOfCharactersToBeDeletedToFormAnAnagram(@"abcd", @"cba");
    
    getAllCombinationsOfString(@"abcd");
    
    return 0;
}


BOOL isAnagram(NSString* stringA,
               NSString* stringB){
    
    if (!(stringA.length == stringB.length)) {
        return false;
    }
    
    //check if the strings are an anagram
    int countOfMatches = 0;
    NSInteger lastIndex = stringA.length - 1;
    
    for (int i = 0; i < lastIndex + 1; i++) {
    
        NSString* subStringFromStringA =
        [stringA substringWithRange:NSMakeRange(i, 1)];
        
        NSString* subStringFromStringB =
        [stringB substringWithRange:NSMakeRange(lastIndex - i, 1)];
        
        if([subStringFromStringA isEqualToString:subStringFromStringB]){
            countOfMatches++;
        } else {
            break;
        }
        
    }
    
    if (countOfMatches == lastIndex + 1) {
        return true;
    } else {
        return false;
    }
}


NSNumber* numberOfCharactersToBeDeletedToFormAnAnagram(
                                                       NSString* stringA,
                                                       NSString* stringB
                                                       )
{
    
    NSInteger lengthOfStringA = stringA.length;
    NSInteger lengthOfStringB = stringB.length;
    
    //check if both strings are of same length
    if (lengthOfStringA == lengthOfStringB) {
    //if yes
        
    //check if anagram
        if (isAnagram(stringA, stringB)) {
            
        } else {
            
        }
    } else {
        
            //if no
            
            //find longer String
            NSString* longerString =
            (lengthOfStringA > lengthOfStringB) ? stringA : stringB;
            
            NSString* shorterString =
            (lengthOfStringA > lengthOfStringB) ? stringB : stringA;
            
            NSInteger lengthOfShorterString =
            shorterString.length;
            
            NSInteger lengthOfLongerString =
            longerString.length;
            
            NSInteger differenceInLength = lengthOfLongerString - lengthOfShorterString;
            
            //remove substrings from index 0 of longer string so that both strings are of equal length
            NSUInteger startIndex = 0;
            NSUInteger indexFrom = (startIndex + differenceInLength);
            NSString* subStringFromLongerStringFromAnIndex = [longerString substringFromIndex:indexFrom];
            
            //check if anagram
            if (isAnagram(subStringFromLongerStringFromAnIndex, shorterString)){
                
            } else {
                
                //remove 1 substring of  index 0 of both strings
                //..longer string will be trimmed from index 0 till it is of the same count as 
                int countOfIndicesToReduce = 0;
                NSUInteger startIndexForForwardTraversal = 0;
                NSUInteger indexInUse = startIndexForForwardTraversal + countOfIndicesToReduce;
                
                while (countOfIndicesToReduce < shorterString.length){
                    //check for anagram untill we reach last index
                    NSString* substringFromShortherString =
                    [shorterString substringFromIndex:indexInUse];
                    
                    NSString* subStringFromReducedLongerString =
                    [subStringFromLongerStringFromAnIndex substringFromIndex:indexInUse];
                    
                    //check if Anagram
                    if (isAnagram(substringFromShortherString, subStringFromReducedLongerString)) {
                        break;
                    } else {
                        //if no
                        //continue
                        countOfIndicesToReduce++;
                        indexInUse = startIndexForForwardTraversal + countOfIndicesToReduce;
                    }
                    
                }
                
                // start from last index
                
                //if no
                //remove substrings from last index of longer string so that both strings are of equal length
                NSUInteger startIndexForReverseTraversal = lengthOfLongerString - 1;
                NSUInteger indexTo = (startIndexForReverseTraversal + differenceInLength);
                NSString* subStringFromLongerStringToAnIndex = [longerString substringToIndex:indexTo];
                
                //check if anagram
                if (isAnagram(subStringFromLongerStringToAnIndex, shorterString)){
                    
                } else {
                    
                    //remove 1 substring of  index 0 of both strings
                    int countOfIndicesToReduce = 0;
                    NSUInteger startIndexForReverseTraversal = lengthOfLongerString - 1;
                    NSUInteger indexInUse = startIndexForReverseTraversal + countOfIndicesToReduce;
                    
                    while (countOfIndicesToReduce > 1){
                        //check for anagram untill we reach last index
                        NSString* substringFromShortherString =
                        [shorterString substringFromIndex:indexInUse];
                        
                        NSString* subStringFromReducedLongerString =
                        [subStringFromLongerStringToAnIndex substringFromIndex:indexInUse];
                        
                        //check if Anagram
                        if (isAnagram(substringFromShortherString, subStringFromReducedLongerString)) {
                            break;
                        } else {
                            //if no
                            //continue
                            countOfIndicesToReduce++;
                            indexInUse = (startIndexForReverseTraversal + differenceInLength);
                        }
                        
                    }
                    
                    
                }
                
                
            }
            
        
        
    }
    
    
    
    
    
    
    
    //if no
    
    //remove substrings from last index of longer string  so that both strings are of equal length
    
    //check if anagram
    
    //if no
    
    //remove 1 substring of  last index  of both strings
    
    //check for anagram untill we reach first index
    
    
    
    

    return @0;
}


NSString* reverseAString(NSString* inputString) {
    
    NSMutableArray<NSString*>* arrayOfStringChars = [@[] mutableCopy];
    
    for (NSInteger i = inputString.length - 1; i >= 0 ; i--) {
        
        NSString* subStringFromStringA =
        [inputString substringWithRange:NSMakeRange(i, 1)];
        
        [arrayOfStringChars addObject:subStringFromStringA];
        
    }

    NSString* reversedString =
    [arrayOfStringChars componentsJoinedByString:@""];
    
    return [reversedString copy];
}

NSNumber* __numberOfCharactersToBeDeletedToFormAnAnagram(
                                                       NSString* stringA,
                                                       NSString* stringB
                                                       )
{
    NSInteger lengthOfStringA =
    stringA.length;
    
    NSInteger lengthOfStringB =
    stringB.length;
    
    NSString* longerString =
    (lengthOfStringA > lengthOfStringB) ? stringA : stringB;
    
    NSString* shorterString =
    (lengthOfStringA > lengthOfStringB) ? stringB : stringA;
    
    NSInteger lengthOfShorterString =
    shorterString.length;
    
    NSInteger lengthOfLongerString =
    longerString.length;
    
    NSInteger lastIndex =
    lengthOfShorterString - 1;
    
    NSInteger countOfGroupOfChars =
    lengthOfShorterString;
    
    NSString* anagramOfShortString =
    reverseAString(shorterString);
    
    for (int i = 0; i < lastIndex + 1; i++) {
        
        //NSString* subStringFromLongerString =
        //[longerString substringWithRange:NSMakeRange(i, 1)];
        
        //NSString* subStringFromShorterString =
        //[shorterString substringWithRange:NSMakeRange(lastIndex - i, 1)];
        
        NSInteger startrIndex = 0;
        
        
        
        while (startrIndex <= (lengthOfLongerString - lengthOfShorterString)) {
            
            NSString* substringFromStartIndex =
            [longerString substringWithRange:NSMakeRange(startrIndex, lengthOfShorterString)];
            
            if (isAnagram(substringFromStartIndex, shorterString)) {
                
            } else {
 
            
                NSInteger startIndex = 0;
    
                NSMutableString* combinatorialString =
                [@"" mutableCopy];
                
                NSInteger movingIndex = startIndex;
             
                //A:
                
                for (NSInteger index = startIndex; index <= lengthOfShorterString ; index++) {
                    
                    NSString* substringAtCurrentIndex =
                    [longerString substringWithRange:NSMakeRange(index, 1)];
                    
                    [combinatorialString appendString:substringAtCurrentIndex];
                    
                    if (index == lengthOfShorterString) {
                        
                    }
                    
                    if (combinatorialString.length == lengthOfShorterString) {
                        break;
                    } else {
                        //movingIndex ++;
                    }
                }
                
//                if (!(isAnagram(combinatorialString, shorterString))) {
//                    
//                } else {
                    startIndex++;
                    movingIndex = startIndex;
                    combinatorialString = [@"" mutableCopy];
                    //goto A;
                //}
                
                
            }
            
            startrIndex++;
        }
        
        
    }

    
    return @0;
}

NSArray<NSString*>* getAllCombinationsOfString(NSString* inputString){
    
    
    NSInteger lengthOfShorterString = inputString.length;
    
    NSInteger count = 3;
    
    NSInteger startIndex = 0;
    
    NSMutableString* combinatorialString =
    [@"" mutableCopy];
    
    NSMutableArray<NSString*>* arrayOfStrings = [@[] mutableCopy];
    
    NSInteger movingIndex = startIndex;
    
    NSInteger indexToExclude = 0;
    
    NSInteger indexBeforeReset = 0;
    
    for (NSInteger index = 0; index < lengthOfShorterString ; index++) {
        
        NSString* substringAtCurrentIndex =
        [inputString substringWithRange:NSMakeRange(index, 1)];
        
        [combinatorialString appendString:substringAtCurrentIndex];
        
       
        if (combinatorialString.length == count) {
            //break;
            [arrayOfStrings addObject:combinatorialString];
        } else {
            //movingIndex ++;
        }
    }

    
    return @[];
}

