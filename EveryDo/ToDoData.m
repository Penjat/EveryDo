//
//  ToDoData.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ToDoData.h"

@implementation ToDoData

-(instancetype)initWithName:(NSString*)name priority:(enum TODO_PRIORITY)priority date:(NSDate*)date{
    self = [super init];
    if (self) {
        _name = name;
        _isDone = false;//if loading form saved file will need to check
        _priority = priority;
        _dateToComplete = date;
    }
    return self;
}
+(NSString*)getStringFromEnum:(enum TODO_PRIORITY)priority{
    
    if(priority == HIGH){
        return @"high";
    }
    if(priority == LOW){
        return @"low";
    }
    if(priority == URGENT){
        return @"urgent";
    }
    if(priority == MEDIUM){
        return @"medium";
    }
    //default to medium
    return @"medium";
}


@end
