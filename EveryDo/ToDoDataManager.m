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
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:10];
        [comps setMonth:2];
        [comps setYear:2019];
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        
        comps = [[NSDateComponents alloc] init];
        [comps setDay:22];
        [comps setMonth:2];
        [comps setYear:2019];
        NSDate *date2 = [[NSCalendar currentCalendar] dateFromComponents:comps];
        
        comps = [[NSDateComponents alloc] init];
        [comps setDay:31];
        [comps setMonth:1];
        [comps setYear:2019];
        NSDate *date3 = [[NSCalendar currentCalendar] dateFromComponents:comps];
        
        _toDoList = [[NSMutableArray alloc]init];
        ToDoData *sample1 = [[ToDoData alloc]initWithName:@"pick up food" priority:HIGH date: date];
        ToDoData *sample2 = [[ToDoData alloc]initWithName:@"pay bills" priority:LOW date: date2];
        ToDoData *sample3 = [[ToDoData alloc]initWithName:@"wash dishes" priority:MEDIUM date: date3];
        
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
-(void)addNewTask:(ToDoData*)task{
    [self.toDoList addObject:task];
    
    
}
-(ToDoData*)getCellNotDoneDataAtIndex:(NSUInteger)index{
    //I know this is bad code
    NSInteger i = index;
    for (ToDoData *toDo in self.toDoList){
        
        if(i ==0 && !toDo.isDone){
            return toDo;
        }else{
            i--;
        }
        
    }
    return nil;
}
-(NSInteger)countNotDone{
    NSInteger i = 0;
    for (ToDoData *data in self.toDoList) {
        if(data.isDone == NO){
            i++;
        }
    }
    return i;
    
}
-(void)updateDataModel:(ToDoData*)newData withBool:(BOOL)isDone{
    //cycle through objects and update the toggle value
    for (ToDoData *toDo in self.toDoList) {
        if(toDo == newData){
            NSLog(@"found a match");
            toDo.isDone = isDone;
            return;
        }
    }
    NSLog(@"no match found");
}
-(void)sortForMostUrgent{
    NSMutableArray<ToDoData*> *sortArray = [[NSMutableArray alloc]init];
    
    for(ToDoData *dataToAdd in self.toDoList){
        int pos = 0;
        for(ToDoData *dataToCheck in sortArray){
            if( (int)dataToAdd.priority > (int)dataToCheck.priority){
                break;
            }else{
                pos++;
            }
            
        }
        NSLog(@"breaking but reached the log");
        [sortArray insertObject:dataToAdd atIndex:pos];
    }
    _toDoList = sortArray;
}
-(void)sortForLeastUrgent{
    NSMutableArray<ToDoData*> *sortArray = [[NSMutableArray alloc]init];
    
    for(ToDoData *dataToAdd in self.toDoList){
        int pos = 0;
        for(ToDoData *dataToCheck in sortArray){
            if( (int)dataToAdd.priority < (int)dataToCheck.priority){
                break;
            }else{
                pos++;
            }
            
        }
        NSLog(@"breaking but reached the log");
        [sortArray insertObject:dataToAdd atIndex:pos];
    }
    _toDoList = sortArray;
}
-(void)sortForDate{
    NSMutableArray<ToDoData*> *sortArray = [[NSMutableArray alloc]init];
    
    for(ToDoData *dataToAdd in self.toDoList){
        int pos = 0;
        for(ToDoData *dataToCheck in sortArray){
            if([dataToCheck.dateToComplete timeIntervalSinceDate:dataToAdd.dateToComplete] >0){
            //if( (int)dataToAdd.priority < (int)dataToCheck.priority){
                break;
            }else{
                pos++;
            }
            
        }
        NSLog(@"breaking but reached the log");
        [sortArray insertObject:dataToAdd atIndex:pos];
    }
    _toDoList = sortArray;
}

@end
