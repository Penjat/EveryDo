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

@end
