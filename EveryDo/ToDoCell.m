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
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end
@implementation ToDoCell
- (IBAction)isDoneButton:(UIButton*)sender {
    
    //TODO change the value in the data maodel
    self.isDone = !self.isDone;
    
    [self.delegate updateDataModel:self.data withBool:self.isDone];
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
    self.data = data;
    self.name.text = data.name;
    self.priorityLabel.text = [ToDoData getStringFromEnum: data.priority];
    self.priorityLabel.textColor = [ToDoCell getColorForPriority:data.priority];
    
    
    
   
    
    
    
    NSInteger daysFromNow = [ToDoCell daysBetweenDate:[NSDate date] andDate:data.dateToComplete];
    
    self.dateLabel.text = [NSString stringWithFormat: @"%i days from now",daysFromNow ];
}
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
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
