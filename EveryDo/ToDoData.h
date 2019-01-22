//
//  ToDoData.h
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

enum TODO_PRIORITY {
    URGENT,
    HIGH,
    MEDIUM,
    LOW
    
};

@interface ToDoData : NSObject




-(instancetype)initWithName:(NSString*)name priority:(NSString*)priority;

@property (strong,nonatomic)NSString *name;
@property (nonatomic)enum TODO_PRIORITY priority;
@property (nonatomic)BOOL isDone;

@end

NS_ASSUME_NONNULL_END
