//
//  main.m
//  CrakingCodeFromhackerrank
//
//  Created by sanooj on 10/12/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import <Foundation/Foundation.h>




//Ransom Note

@protocol Seqeunce <NSObject>

void enumerate();

@end

NSDictionary<NSString*,NSNumber*>* makeDictionaryOfWords(NSString* sentence)
{
     NSMutableDictionary<NSString*,NSNumber*>* __block magazineHash =
    [@{} mutableCopy];
    
    [sentence enumerateSubstringsInRange:NSMakeRange(0, sentence.length)
                                 options:(NSStringEnumerationOptions)NSStringEnumerationByWords
                              usingBlock:
     ^(NSString * _Nullable substring,
       NSRange substringRange,
       NSRange enclosingRange,
       BOOL * _Nonnull stop)
     {
    
    NSNumber* countval =
    magazineHash[substring];
    
    if (countval == NULL)
    {
        magazineHash[substring] =
        @1;
    }
    else
    {
        magazineHash[substring] =
        @(countval.intValue + 1);
    }

}];
    
    return [magazineHash copy];
};


NSInteger sumOfHashes(NSDictionary<NSString*,NSNumber*>* hash)
{
    NSInteger __block sum = 0;
    
    [hash enumerateKeysAndObjectsUsingBlock:
     ^(NSString * _Nonnull key, NSNumber * _Nonnull obj, BOOL * _Nonnull stop)
     {
         sum = sum + obj.integerValue;
     }];
    
    return sum;
}





void checkIfWeCanMakeARansomNote(NSString* magazine,NSString* ransom)
{
    NSDictionary<NSString*,NSNumber*>* magazineHash =
    makeDictionaryOfWords(magazine);
    
    NSDictionary<NSString*,NSNumber*>* ransomHash =
    makeDictionaryOfWords(ransom);
    
    NSInteger sumOfMagazineHash =
    sumOfHashes(magazineHash);
    
    NSInteger sumOfRansomHash =
    sumOfHashes(ransomHash);
    
    NSInteger count __block = 0;
    
    [ransomHash enumerateKeysAndObjectsUsingBlock:
     ^(NSString * _Nonnull key, NSNumber * _Nonnull obj, BOOL * _Nonnull stop)
     {
         NSNumber* countvalOfKeyInMagazineHash =
         magazineHash[key];
         
         count = count + countvalOfKeyInMagazineHash.integerValue;
        
    }];
    
   
    NSLog(@"%@",count == sumOfRansomHash ? @"YES" : @"NO");
    
    
}

NSString* toString(NSString* __strong stringArray[],int count)
{
    NSMutableString* stringC = [@"" mutableCopy];
    
    for(int ransom_i = 0; ransom_i < count; ransom_i++)
    {
        [stringC appendString:stringArray[ransom_i]];
    }
    
    return [stringC stringByReplacingOccurrencesOfString:@"" withString:@""];
}

NSString* __autoreleasing *  toArray(NSString* string, NSInteger count)
{
    NSString* __autoreleasing u[] =
    {};

   for(int index = 0; index < count; index++)
   {
       u[index] = [string substringWithRange:NSMakeRange(index, 1)];
   }

    return u;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString* u[] =
        {@"t",@"w",@"o",@" ",@"t",@"i",@"m",@"e",@"s",@" ",@"t",@"h",@"r",@"e",@"e"};
        
        toString(u, 15);
        
        NSInteger len =
        [@"two times three is not four" length];
        
        NSString* __autoreleasing ul[len];
        
        for(int index = 0; index < [@"two times three is not four" length]; index++)
        {
            NSString* subString = [@"two times three is not four" substringWithRange:NSMakeRange(index, 1)];
            
            ul[index] = subString;
        }
        
        checkIfWeCanMakeARansomNote(
                                    @"give me one grand today night",
                                    @"give one grand today"
                                    );
        
    }
    return 0;
}
