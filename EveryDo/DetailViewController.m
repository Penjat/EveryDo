//
//  DetailViewController.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "DetailViewController.h"
#import "ToDoDataManager.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepperDay;
@property (weak, nonatomic) IBOutlet UIStepper *stepperMonth;
@property (weak, nonatomic) IBOutlet UIStepper *stepperYear;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.dataIndex == -1){
        UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonPressed)];
        
        self.navigationItem.rightBarButtonItem = homeButton;
        
        
    }else{
        UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(beginEditting)];
        
        self.navigationItem.rightBarButtonItem = homeButton;
    }
    
    
    
    [self setUpFromData];
    [self setUpFieldsEditable];
}
-(void)saveButtonPressed{
    NSLog(@"should save");
    
    //if this is a new task
    if(self.dataIndex == -1){
        NSString *name = self.titleField.text;
        enum TODO_PRIORITY priority = (enum TODO_PRIORITY) self.prioritySlider.value;
        ToDoData *newTask = [[ToDoData alloc]initWithName:name priority:priority date:[NSDate date]];
        [[ToDoDataManager sharedInstance] addNewTask:newTask] ;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        ToDoData *data = [[ToDoDataManager sharedInstance] getCellDataAtIndex:self.dataIndex];
        data.name = self.titleField.text;
        data.priority = (enum TODO_PRIORITY) self.prioritySlider.value;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}
-(void)beginEditting{
    NSLog(@"should begin editting");
    self.editData = YES;
    [self setUpFieldsEditable ];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveButtonPressed)];
    
    self.navigationItem.rightBarButtonItem = homeButton;
}
-(void)setUpFromData{
    //sets up all the fields with the correct data from the toDoData
    ToDoData *data = nil;
    
    //if is creating
    if(self.dataIndex == -1){
        data = [[ToDoData alloc]initWithName:@"New Task" priority:MEDIUM date: [NSDate date]];
    }else{
        data = [[ToDoDataManager sharedInstance] getCellDataAtIndex:self.dataIndex];
    }
    
    
    self.titleField.text = data.name;
    self.priorityField.text = [ToDoData getStringFromEnum: data.priority];
    self.priorityField.textColor = [ToDoCell getColorForPriority:data.priority];
    self.prioritySlider.value = (int) data.priority;
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
