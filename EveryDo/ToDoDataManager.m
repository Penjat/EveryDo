//
//  ToDoDataManager.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ToDoDataManager.h"

@implementation ToDoDataManager


+ (instancetype)sharedInstance{
    static ToDoDataManager *dataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataManager = [[ToDoDataManager alloc] init];
        
    });
    return dataManager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _toDoList = [[NSMutableArray alloc]init];
        ToDoData *sample1 = [[ToDoData alloc]initWithName:@"pick up food" priority:HIGH];
        ToDoData *sample2 = [[ToDoData alloc]initWithName:@"pay bills" priority:LOW];
        ToDoData *sample3 = [[ToDoData alloc]initWithName:@"wash dishes" priority:MEDIUM];
        
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
-(void)createNewTODO{
    ToDoData *newTODO = [[ToDoData alloc]initWithName:@"New Task" priority:LOW];
    [self.toDoList addObject:newTODO];
}
-(ToDoData*)getLast{
    return [self.toDoList lastObject];
}


@end
