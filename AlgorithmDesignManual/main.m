//
//  main.m
//  AlgorithmDesignManual
//
//  Created by sanooj on 10/7/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "Symantecx.h"

#include "DataStructures.h"

#include "DataStructuresActual.h"

void mTh(int s[],int mthIndex);


NSArray<NSString*>* generateSubstrings(NSString* string){
    
    NSString* stringToUse = string;
    
    NSMutableArray* subStrings = [@[] mutableCopy];
    
    for (NSInteger index = 0 ; index <= stringToUse.length; index++) {
        
        NSString* subString = [stringToUse substringToIndex:index];
        
        if (subString.length > 0) {
            [subStrings addObject:subString];
        }
        
    }
    
    
    for (NSInteger index = stringToUse.length ; index >= 0; index--) {
        
        NSString* subString = [stringToUse substringToIndex:index];
        
        if (subString.length > 0) {
            [subStrings addObject:subString];
        }
        
    }
    return [subStrings copy];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    int array[] = {1,2,3,4,5};
    
    //mTh(array, 4);
    
    NSString* string = @"Here i come.".lowercaseString;
    string = [[string copy] stringByReplacingOccurrencesOfString:@"." withString:@""];
   
    NSArray<NSString *> * stringArrayofWords =
    [string componentsSeparatedByString:@" "];
    
     NSMutableArray<NSString *> * sortedArray =
    [[[stringArrayofWords copy] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
   
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
    
    
    
    
    NSMutableString* stringToUse = [@"kincenvizh" mutableCopy];
    
    
    
    
    //other combos
    //run the same with each reduced string
    
//    NSMutableArray* _subStrings = [@[] mutableCopy];
//    for (NSInteger index = 0 ; index <= stringToUse.length; index++) {
//        
//        NSString* subString = [stringToUse substringToIndex:index];
//        
//        if (subString.length > 0) {
//            [_subStrings addObject:subString];
//        }
//        
//    }
//    
//
//    for (NSInteger index = stringToUse.length ; index >= 0; index--) {
//        
//        NSString* subString = [stringToUse substringToIndex:index];
//        
//        if (subString.length > 0) {
//            [_subStrings addObject:subString];
//        }
//        
//    }

    
        NSMutableArray* _subStrings = [@[] mutableCopy];
    
    //NSString* stringToUse = @"kincenvizh";
    
    
        for (NSInteger index = 0 ; index <= stringToUse.length; index++) {
    
            NSString* subString = [stringToUse substringToIndex:index];
    
            if (subString.length > 0) {
                NSArray* arrayOfSubstrings =
                generateSubstrings(stringToUse);
                
                [_subStrings addObjectsFromArray:arrayOfSubstrings];
            }
            
        }
    

    
    
    
    
    
    

    //eliminate dupicates
    NSSet<NSString*>* finalListOfSubstrings =
    [[NSSet alloc] initWithArray:_subStrings];
    
    NSLog(@"%lu", (unsigned long)[finalListOfSubstrings count]);
    
    [[NSNumber alloc] initWithLong:[finalListOfSubstrings count]];
  
    
    
    getAllSubstringsFromString(@"");
    
    
    //"fcrxzwscanmligyxyvym"
    
    //"jxwtrhvujlmrpdoqbisbwhmgpmeoke"
    
    //sortWordsBasedSizeAndCapitalizeFirstWord(@"Here i come.");
    
    
    
    
    //getAllAnagarams(@"fcrxzwscanmligyxyvym", @"jxwtrhvujlmrpdoqbisbwhmgpmeoke");
    
    
    
    
    int arraay[] = {1,3,2,6,4};
    int arraay2[] = {1,3,2,6,4};
    
    [DataStructures selectionSortAnArray:arraay withCount:5];

    [DataStructures insertionSortAnArray:arraay2 withCount:5];
    
    [DataStructures findMatchInString:"boomer" subString:"om"];
    
    
    //Linkedlist
    [DataStructuresActual useSinglyLinkedList];
    
    [DataStructuresActual useDoublyLinkedList];
    
    return 0;
    
    
}


//Data Structures

//..Linked Struct

//void linkedDataStructure() {

typedef struct LinkedListC
{
    int member;
    struct LinkedListC* next;
} LinkedListC;

void insertAtTheEnd(LinkedListC** linkedListC,int element)
{
    //create linked list
    LinkedListC* newList = malloc(sizeof(LinkedListC));
    newList->member = element;
    
    //insert at end
    (*linkedListC)->next = newList;
    
    //insert at beginning
};

void insertAtTheBeginning(LinkedListC** linkedListC,int element)
{
    //create linked list
    LinkedListC* newList = malloc(sizeof(LinkedListC));
    newList->member = element;
    
    //insert at beginning
    newList->next = *linkedListC;
    
    //return the new list
    *linkedListC = newList;
};

LinkedListC* search_list(LinkedListC* list,int elementToBeSearched) {
    
    //recursion
    
    //check for null
    if (list == NULL)
    {
        return NULL;
    }
    
    //if list contains  the element
    if (list->member == elementToBeSearched)
    {
        return list;
    }
    else
    {
        //do this again with the next element
        return search_list(list->next,elementToBeSearched);
    }
}
void mTh(int s[],int mthIndex)
{
    //convert array to linked list
    int index = 0;
    int sizeOfArray = sizeof(*s)/sizeof(s[0]);
    
    LinkedListC* list = malloc(sizeof(LinkedListC));
    list->member = s[index];
    while (index < sizeOfArray)
    {
        if (index == 0)
        {
            continue;
        }
        else
        {
            index++;
            insertAtTheEnd(&list,s[index]);
        }
        
    }
    
    //list traversal while counting indexes
    int indexCount = 0;
    while (list->next != NULL)
    {
        if (indexCount == mthIndex)
        {
            printf("mth index %d",indexCount);
            break;
        }
        indexCount++;
    }
    
}






