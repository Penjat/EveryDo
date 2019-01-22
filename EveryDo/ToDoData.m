//
//  ToDoData.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "ToDoData.h"

@implementation ToDoData

-(instancetype)initWithName:(NSString*)name priority:(NSString*)priority{
    self = [super init];
    if (self) {
        _name = name;
        _isDone = false;//if loading form saved file will need to check
        _priority = priority;
    }
    return self;
}

@end
