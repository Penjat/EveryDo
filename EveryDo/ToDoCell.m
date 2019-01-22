//
//  ToDoCell.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//


#import "ToDoCell.h"





@interface ToDoCell(){
    
}


@end
@implementation ToDoCell
- (IBAction)isDoneButton:(UIButton*)sender {
    
    //TODO change the value in the data maodel
    self.isDone = !self.isDone;
    if(self.isDone){
        [sender setTitle:@"☑︎" forState:UIControlStateNormal];
        return;
    }
    [sender setTitle:@"☐" forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUpWithData:(ToDoData*)data{
    self.name.text = data.name;
    self.priorityLabel.text = [ToDoData getStringFromEnum: data.priority];
    self.priorityLabel.textColor = [ToDoCell getColorForPriority:data.priority];
}

+(UIColor*)getColorForPriority:(enum TODO_PRIORITY)priority{
    if(priority == HIGH){
        return UIColor.orangeColor;
    }
    if(priority == LOW){
        return UIColor.greenColor;
    }
    if(priority == URGENT){
        return UIColor.redColor;
    }
    if(priority == MEDIUM){
        return UIColor.yellowColor;
    }
    //default to medium
    return UIColor.orangeColor;;
}



@end
