//
//  DataStructuresActual.m
//  ILearnCpp
//
//  Created by sanooj on 10/21/17.
//  Copyright © 2017 DCore. All rights reserved.
//

#import "DataStructuresActual.h"

typedef int item_type;

#pragma mark -
#pragma mark Singly Linked List

//struct
typedef struct list
{
    item_type item;
    struct list* next;
} list;


//search
list* search_list(list* l, item_type x)
{
    //nULL check
    if (l == NULL)
    {
        return NULL;
    }
    
    //match
    if (l->item == x)
    {
        return l;
    }
    else
    {
        //recurse //find
        return search_list(l->next, x);
    }
}

// find predecessor or previous node
list* predecessor(list*l,item_type x)
{
    //NULL Check
    if ((l == NULL) && (l->next == NULL))
    {
        return NULL;
    }
    
    //check if l->next == x
    if (l->next->item == x)
    {
        return l;
    }
    else
    {
        //recurse
        return predecessor(l->next, x);
    }
}
//delete
/*
 1. find the node with the element to delete
 2. find its predecessor
 3. if predecessor == NULL
      1. element is head
      2. element = element->next
 4. if predecessor != NULL
      1. predecessor->next = element->next
 */
void delete_list(list* l, item_type x)
{
    //find the node
    list* nodeWithSearchedElement =
    search_list(l, x);
    
    //Null check
    if (nodeWithSearchedElement != NULL)
    {
        /*
         update the next pointer
         1. find the predecessor
         2. predecessor->next = nodeWithSearchedElement->next
         */
        
        //find predecessor
        list* predecessorToSearchedElement =
        predecessor(l, x);
        
        //Null check
        if (predecessorToSearchedElement != NULL)
        {
            predecessorToSearchedElement->next =
            nodeWithSearchedElement->next;
        }
        else
            /*
             no prdecessor
             must be head
             reassign head
             */
        {
            l = nodeWithSearchedElement->next;
        }
        
        //free
        free(nodeWithSearchedElement);
    }

}

//insert
/*
 1. create a "new_node"
 2. insert top or bottom of list
 3. if at top
      1. assign current head as the new node's next
            new_node->next = head
 4. if at bottom
      1. find the node with node->next == NULL
      2. node->next = new_node
 */
 list*  insert(list** l, item_type x)
{
    //inserting at top is easier
    //botton would require us to traverse the list
    
    //new_node
    list* new_node = (list*)malloc(sizeof(list));
    new_node->item = x;
    
    if (l != NULL)
    {
        new_node->next = *l ;
        //(*l)->next = new_node;
        
        //assign new_node as head
        *l = new_node;
        
        return *l;
    }
   
    return new_node;
}

#pragma mark -
#pragma mark Doubly Linked List

typedef struct db_list
{
    item_type item;
    db_list* next;
    db_list* previous;

} db_list;

db_list* insert_db_list(db_list** dbl, item_type x)
{
    
    //create an empty node
    db_list* new_node =
    (db_list*) malloc(sizeof(db_list));
    
    //assign
    new_node->item = x;
    
    //check NULL
    if (dbl == NULL)
    {
        
        new_node->next = NULL;
        new_node->previous = NULL;
        
        return new_node;
    }
    else
    {
        //insert on top.
        new_node->next =
        *dbl;
        
        new_node->previous =
        NULL;
        
        
        //adjust previous pointer of the passed on list
        (*dbl)->previous =
        new_node;
        
        //reassign
        *dbl = new_node;
        
        return  new_node;
    }
}

bool is_Searched_Item_db_list(db_list** dbl, item_type x)
{
    db_list* currentNode =
    *dbl;
    
    //NULL check
    if (currentNode != NULL)
    {
        //chgeck if current node is the searched
        if (currentNode->item == x)
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

db_list* search_db_list(db_list** dbl, item_type x)
{
    if (dbl != NULL)
    {
        db_list* currentNode =
        *dbl;
        
        //check if current node is the searched
        if (is_Searched_Item_db_list(dbl, x))
        {
            return currentNode;
        }
        else
        {
            //check if previous or next nodes is the searched node
            db_list* nextNode =
            (*dbl)->next;
            
            db_list* previousNode =
            (*dbl)->previous;
            
            if (is_Searched_Item_db_list(&nextNode, x))
            {
                return nextNode;
                
            }
            else if (is_Searched_Item_db_list(&previousNode, x))
            {
                return previousNode;
            }
            else
            {
                //recurse
                return search_db_list(&(currentNode->next), x);
            }
        }
        
    }
    else
    {
        return NULL;
    }
    
}

void delete_db_list(db_list** dbl, item_type x)
{
    //find the node
    db_list* nodeWithSearchedElement =
    search_db_list(dbl, x);
    
    //Null check
    if (nodeWithSearchedElement != NULL)
    {
        //adjust next pointer of the predecessor
        //predessorNode->next = nodeWithSearchedElement->next
        db_list* predessorNode =
        nodeWithSearchedElement->previous;
        
        predessorNode->next =
        nodeWithSearchedElement->next;
        
        //adjust previous pointer of successor
        //successorNode->previous = nodeWithSearchedElement->previous;
        db_list* successorNode =
        nodeWithSearchedElement->next;
        
        successorNode->previous =
        nodeWithSearchedElement->previous;
        
        //free
        free(nodeWithSearchedElement);
    }
}
#pragma mark -
#pragma mark Binary Search Tree
typedef struct tree
{
    item_type item;
    struct tree* parent;
    struct tree* left;
    struct tree* right;
    
    //basic ops
    //search
    //traversal
    //insertion
    //deletion
    
} tree;

//search

tree* search_tree(tree *l, item_type x)
{
    return NULL;
}

#pragma mark -
#pragma mark DataStructuresActual
@implementation DataStructuresActual

+(void)useSinglyLinkedList
{
    list* l = NULL;
    
    //insert op
    for (NSNumber* number in @[@1,@2,@3,@4,@5])
    {
        if (l == NULL)
        {
            l = insert(NULL, [number intValue]);
        }
        else
        {
            insert(&l, [number intValue]);
        }
        
    }
    
    //delete op
    delete_list(l, 4);
    
    
    //search op
    list* list_element = NULL;
    list_element =
    search_list(l, 2);
    
}

+(void)useDoublyLinkedList
{
    db_list* l = NULL;
    
    //insert op
    for (NSNumber* number in @[@1,@2,@3,@4,@5])
    {
        if (l == NULL)
        {
            l = insert_db_list(NULL, [number intValue]);
        }
        else
        {
            insert_db_list(&l, [number intValue]);
        }
        
    }
    
    //delete op
    delete_db_list(&l, 4);
    
    
    //search op
    db_list* list_element = NULL;
    list_element =
    search_db_list(&l, 2);
    
}

@end
