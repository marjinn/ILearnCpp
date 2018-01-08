//
//  DataStructures.m
//  ILearnCpp
//
//  Created by sanooj on 10/16/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import "DataStructures.h"

@implementation DataStructures


void swap(int* first,int* second)
{
    int tmp  = *first;
    *first = *second;
    *second = tmp;
}

+(void)selectionSortAnArray:(int[])array withCount:(int) arrayLength
{
    int i,j = 0; //counters
    int min = 0;
    
    //swap positions
    for (i = 0; i < arrayLength; i++)
    {
        min = i;
        for (j = i + 1 ; j < arrayLength; j++)
        {
            if (array[j] < array[min])
            {
                min = j;
            }
            
//            int tmp  = array[i];
//            array[i] = array[min];
//            array[min] = tmp;
            swap(&array[i], &array[min]);
        }
    }
    
    
    
    
}

+(void)insertionSortAnArray:(int[])array withCount:(int) arrayLength
{
    int i,j = 0; //counters
    
    //swap positions
    for (i = 1; i < arrayLength; i++)
    {
        j = i;
        
        while ((j > 0) && (array[j] < array[j-1]))
        {
            swap(&array[j], &array[j-1]);
            j = j - 1;
        }
    }

}


+(int) findMatchInString:(char*)string subString:(char*)subString
{
    int i,j = 0; //counters
    long m,n = 0; // stringlength
    
    m = strlen(string);
    n = strlen(subString);
    
    for (i = 0; i < (n-m); i = i+1)
    {
        j = 0;
        
        char susbtringInQ =
        subString[i+j];
        
        char currentString =
        string[j];
        
        while ((j < m) && (susbtringInQ == currentString))
        {
            j = j + 1;
        }
        
        if (j == m)
        {
            return i;
        }
    }
    
    
    
    int matchCount = 0;
    
    //main string loop
    for (int i = 0; i < m; i++)
    {
        //substringLoop
        for (int j = 0; j < n; j++)
        {
            //comparison
            if (string[i] == subString[j])
            {
                matchCount++;
            }
            
            if (matchCount == n)
            {
                
            }
        }
        
       
    }
    
    
    
    return (-1);
}


void matrixMultiplication(int row, int column,int z)
{
    int i,j,k = 0;
    int C[0][0], A[0][0], B[0][0] = {};
    
    for (i = 1; i <= row; i++)
    {
        for (j = 1; j <= column; j++)
        {
            C[i][j] = 0;
            for (k = 1; k <= z; k++)
            {
                C[i][j] += A[i][k] * B[k][j];
            }
            
        }
    }
}

@end
