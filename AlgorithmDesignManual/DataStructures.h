//
//  DataStructures.h
//  ILearnCpp
//
//  Created by sanooj on 10/16/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStructures : NSObject
+(void)selectionSortAnArray:(int[])array withCount:(int) arrayLength;
+(void)insertionSortAnArray:(int[])array withCount:(int) arrayLength;
+(int) findMatchInString:(char*)string subString:(char*)subString;
@end
