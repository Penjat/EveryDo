//
//  MainViewController.h
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,UpdateDataModel>
-(void)UpdateDataModel:(ToDoData*)data;
@end

NS_ASSUME_NONNULL_END
