//
//  DetailViewController.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpFromData];
    [self setUpFieldsEditable];
}
-(void)setUpFromData{
    //sets up all the fields with the correct data from the toDoData
    self.titleField.text = self.toDoData.name;
    self.priorityField.text = [ToDoData getStringFromEnum: self.toDoData.priority];
    self.priorityField.textColor = [ToDoCell getColorForPriority:self.toDoData.priority];
    self.prioritySlider.value = (int) self.toDoData.priority;
}
- (IBAction)prioritySliderChanged:(UISlider*)sender {
     self.priorityField.text = self.priorityField.text = [ToDoData getStringFromEnum:   (enum TODO_PRIORITY)sender.value];
    self.priorityField.textColor = [ToDoCell getColorForPriority:(enum TODO_PRIORITY)sender.value];
}

-(void)setUpFieldsEditable{
    //sets the fields to be editable or not
    NSLog(@"setting up the fields");
    
    self.titleField.userInteractionEnabled = self.editData;
    self.prioritySlider.hidden = !self.editData;
    
    
    if(self.editData){
        self.titleField.borderStyle = UITextBorderStyleRoundedRect;
        
    }else{
        self.titleField.borderStyle = UITextBorderStyleNone;
    }
    
}



@end
