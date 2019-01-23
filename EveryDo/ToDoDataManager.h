//
//  ToDoDataManager.h
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoDataManager : NSObject

@property (strong,nonatomic,readonly)NSMutableArray<ToDoData*> *toDoList;
+ (instancetype)sharedInstance;
-(NSInteger)getListCount;
-(ToDoData*)getCellDataAtIndex:(NSUInteger)index;
-(void)addNewTask:(ToDoData*)task;
-(void)updateDataModel:(ToDoData*)data withBool:(BOOL)isDone;

-(void)sortForMostUrgent;
-(void)sortForLeastUrgent;
-(void)sortForDate;
-(NSInteger)countNotDone;
-(ToDoData*)getCellNotDoneDataAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
