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
    NSLog(@"loaded with name %@ , priority %@ ",self.toDoData.name ,self.toDoData.priority);
    
    [self setUpFromData];
    [self setUpFieldsEditable];
}
-(void)setUpFromData{
    //sets up all the fields with the correct data from the toDoData
    self.titleField.text = self.toDoData.name;
    
    
}
-(void)setUpFieldsEditable{
    //sets the fields to be editable or not
    NSLog(@"setting up the fields");
    
    self.titleField.userInteractionEnabled = self.editData;
    
    if(self.editData){
        self.titleField.borderStyle = UITextBorderStyleRoundedRect;
    }else{
        self.titleField.borderStyle = UITextBorderStyleNone;
    }
    
}



@end
