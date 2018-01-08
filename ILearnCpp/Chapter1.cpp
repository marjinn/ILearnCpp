//
//  Chapter1.cpp
//  ILearnCpp
//
//  Created by sanooj on 10/5/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#include "Chapter1.hpp"


void cFunc() {
    
    int dogs;
    
    printf("How many \n");
    scanf("%d", &dogs);
    printf("%d", dogs);
    
    return;
}

void map(std::vector<std::string> input);

bool ransom_note(std::vector<std::string> magazine, std::vector<std::string> ransom)
{
    //magazine
    
    std::map<std::string, int> magazineMap ;
    
    for (std::vector<std::string>::iterator iterator = magazine.begin();iterator != magazine.end(); ++iterator)
    {
        
        std::string substring;
        
        if (*iterator != " ")
        {
            substring.append(*iterator);
        }
        else
        {
            int count = magazineMap[*iterator];
            magazineMap.insert(std::pair<std::string, int>(substring,count + 1));
        }
        
    }
    
    //ransom
//    for (std::vector<std::string>::iterator iterator = ransom.begin();iterator != magazine.end(); ++iterator)
//    {
//        
//    }
    
    return false;
}
