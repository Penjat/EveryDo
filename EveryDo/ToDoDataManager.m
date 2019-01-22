//
//  ToDoDataManager.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ToDoDataManager.h"

@implementation ToDoDataManager

- (instancetype)init{
    self = [super init];
    if (self) {
        _toDoList = [[NSMutableArray alloc]init];
        ToDoData *sample1 = [[ToDoData alloc]initWithName:@"pick up food" priority:@"3"];
        ToDoData *sample2 = [[ToDoData alloc]initWithName:@"pay bills" priority:@"5"];
        ToDoData *sample3 = [[ToDoData alloc]initWithName:@"get high" priority:@"1"];
        
        _toDoList = [NSMutableArray arrayWithObjects:sample1,sample2,sample3, nil];
    }
    return self;
}

-(NSInteger)getListCount{
    //could pass properties depending what should be displayed
    return self.toDoList.count;
}

-(ToDoData*)getCellDataAtIndex:(NSUInteger)index{
    
    return self.toDoList[index];
}



@end
