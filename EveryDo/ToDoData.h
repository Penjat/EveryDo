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
    
    LOW,
    MEDIUM,
    HIGH,
    URGENT
};

@interface ToDoData : NSObject




-(instancetype)initWithName:(NSString*)name priority:(enum TODO_PRIORITY)priority;

@property (strong,nonatomic)NSString *name;
@property (nonatomic)enum TODO_PRIORITY priority;
@property (nonatomic)NSUInteger *index;
@property (nonatomic)BOOL isDone;
+(NSString*)getStringFromEnum:(enum TODO_PRIORITY)priority;
@end

NS_ASSUME_NONNULL_END
