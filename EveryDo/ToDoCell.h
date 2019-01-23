//
//  ToDoCell.h
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoData.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UpdateDataModel
-(void)updateDataModel:(ToDoData*)data withBool:(BOOL)isDone;
@end

@interface ToDoCell : UITableViewCell

@property (nonatomic)id<UpdateDataModel>delegate;
@property (nonatomic,strong)ToDoData *data;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (nonatomic)BOOL isDone;
-(void)setUpWithData:(ToDoData*)data;
+(UIColor*)getColorForPriority:(enum TODO_PRIORITY)priority;
@end

NS_ASSUME_NONNULL_END
