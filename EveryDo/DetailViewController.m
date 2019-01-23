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

@property (weak, nonatomic) IBOutlet UILabel *labelYear;
@property (weak, nonatomic) IBOutlet UILabel *labelMonth;
@property (weak, nonatomic) IBOutlet UILabel *labelDay;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stepperYear.maximumValue = 4000;
    
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
- (IBAction)changeDay:(UIStepper*)sender {
    
    self.labelDay.text = [self dayStringFromInt:sender.value];
    
}
- (IBAction)changeMonth:(UIStepper*)sender {
    self.labelMonth.text = [self monthStringFromInt:sender.value];
}
- (IBAction)changeYear:(UIStepper*)sender {
    self.labelYear.text = [NSString stringWithFormat:@"%li",sender.value ];
}
-(void)saveButtonPressed{
    NSLog(@"should save");
    
    //if this is a new task
    if(self.dataIndex == -1){
        NSString *name = self.titleField.text;
        enum TODO_PRIORITY priority = (enum TODO_PRIORITY) self.prioritySlider.value;
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:self.stepperDay.value];
        [comps setMonth:self.stepperMonth.value];
        [comps setYear:2019];
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        
        ToDoData *newTask = [[ToDoData alloc]initWithName:name priority:priority date:date];
        [[ToDoDataManager sharedInstance] addNewTask:newTask] ;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:self.stepperDay.value];
        [comps setMonth:self.stepperMonth.value];
        [comps setYear:2019];
        NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:comps];
        
        
        ToDoData *data = [[ToDoDataManager sharedInstance] getCellDataAtIndex:self.dataIndex];
        data.name = self.titleField.text;
        data.priority = (enum TODO_PRIORITY) self.prioritySlider.value;
        data.dateToComplete = date;
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
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:data.dateToComplete];
    
    self.labelYear.text = [NSString stringWithFormat:@"%li",components.year ];
    self.labelDay.text = [self dayStringFromInt:components.day];
    self.labelMonth.text = [self monthStringFromInt:components.month];
    
    self.stepperYear.value = components.year;
    self.stepperMonth.value = components.month;
    self.stepperDay.value = components.day;
}
-(NSString*)monthStringFromInt:(NSInteger)month{
    NSArray *months = @[@"January",@"Febuary",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"Decmber"];
    
    return months[month%12];
}
-(NSString*)dayStringFromInt:(NSInteger)day{
//    if(day == 1){
//        return @"1st";
//    }
//    if(day == 2){
//        return @"2nd";
//    }
//    if(day == 3){
//        return @"3rd";
//    }
    return [NSString stringWithFormat:@"%li" , day ];
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
    self.stepperDay.hidden = !self.editData;
    self.stepperMonth.hidden = !self.editData;
    self.stepperYear.hidden = !self.editData;
    
    if(self.editData){
        self.titleField.borderStyle = UITextBorderStyleRoundedRect;
        
    }else{
        self.titleField.borderStyle = UITextBorderStyleNone;
    }
    
}



@end
