//
//  main.cpp
//  ILearnCpp
//
//  Created by sanooj on 10/5/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#include <iostream>
#include "Chapter1.hpp"
#include <vector>
#include <map>
#include <string>

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    cFunc();
    
    std::string one = "they they are not are friends";
    std::string two = "they are my friends";
    
    std::map<std::string, int> magazineMap ;
    std::map<std::string, int> ransomMap ;
    
    std::string substring;
    for (std::string::iterator iterator = one.begin();iterator != one.end(); ++iterator)
    {
        char currentString = *iterator;
        
        if (currentString == ' ')
        {
            int count = 0;
            count = magazineMap[substring];
            magazineMap[substring] = count + 1;
            
            substring = "";

        }
        else
        {
            substring.append(&currentString);
        }
        
    }

    for (std::string::iterator iterator = two.begin();iterator != two.end(); ++iterator)
    {
        
        char currentString = *iterator;
        
        if (currentString == ' ')
        {
            int count = 0;
            count = ransomMap[substring];
            ransomMap[substring] = count + 1;
            
            substring = "";
            
        }
        else
        {
            substring.append(&currentString);
        }
        
    }
    return 0;
}

