//
//  MainViewController.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "MainViewController.h"
#import "ToDoCell.h"
#import "ToDoDataManager.h"
#import "DetailViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)ToDoDataManager *dataManager;
@property (nonatomic)NSUInteger curRow;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataManager = [[ToDoDataManager alloc]init];
    
    
    
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == self.curRow){
        //go to details
        NSLog(@"should go to details %li",indexPath.row);
        [self performSegueWithIdentifier:@"goToDetails" sender:nil];
    }
    self.curRow = indexPath.row;
    return YES;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataManager getListCount];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myToDoCell" ];
    ToDoData *cellData = [self.dataManager getCellDataAtIndex:indexPath.row];
    
    cell.name.text = cellData.name;
    cell.priorityLabel.text = cellData.priority;
    
    return cell;

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //TODO check identifier if adding more views
    DetailViewController *detailController = segue.destinationViewController;
    ToDoData *data = [self.dataManager getCellDataAtIndex:self.curRow];
    [detailController setToDoData:data];
}





@end



