//
//  TestDose.m
//  ILearnCpp
//
//  Created by sanooj on 10/5/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import "TestDose.h"

@implementation TestDose
-(NSString*)findNumber:(NSArray*) arr joinArg2:(NSNumber*) k {
  
    NSString* isPresent = @"YES";
    NSString* isNotPresent = @"NO";
    
    return ([arr containsObject:k] ? isPresent : isNotPresent);
    
};

-(NSArray*)oddNumbers:(NSNumber*) l joinArg2:(NSNumber*) r {
    
    NSMutableArray<NSNumber*>* oddNumbers = [@[] mutableCopy];
    
    for(NSNumber* i = l ; i.intValue <= r.intValue; i = [[NSNumber alloc]initWithInt:i.intValue + 1])
    {
        if (!(i.intValue % 2 == 0)) {
            [oddNumbers addObject:i];
        }
        
    }
    
    return oddNumbers;
}
@end
