//
//  MainViewController.m
//  EveryDo
//
//  Created by Spencer Symington on 2019-01-22.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

#import "MainViewController.h"

#import "ToDoDataManager.h"
#import "DetailViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic)NSUInteger curRow;
@property (nonatomic)BOOL isCreating;
@property (nonatomic)BOOL showAll;//toggles showing all or just the ones left to do
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.showAll = YES;
    [[ToDoDataManager sharedInstance] sortForDate];
    
}
- (IBAction)showAllOrNotDone:(UIBarButtonItem*)sender {
    self.showAll = !self.showAll;
    if(self.showAll){
        sender.title = @"show not done";
    }else{
        sender.title = @"show all";
    }
    [self.tableView reloadData];
}
- (IBAction)sortByPriority:(id)sender {
    [[ToDoDataManager sharedInstance] sortForMostUrgent];
    [self.tableView reloadData];
}
- (IBAction)sortByDate:(id)sender {
    [[ToDoDataManager sharedInstance] sortForDate];
    [self.tableView reloadData];
}
- (IBAction)addToDo:(UIBarButtonItem*)sender {
    NSLog(@"creating new TODO");
    self.isCreating = YES;
    
    [self performSegueWithIdentifier:@"goToDetails" sender:nil];
    
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"highliting");
    if(indexPath.row == self.curRow){
        //go to details
        NSLog(@"should go to details %li",indexPath.row);
        self.isCreating = NO;
        [self performSegueWithIdentifier:@"goToDetails" sender:nil];
    }
    self.curRow = indexPath.row;
    return YES;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.showAll){
        return [[ToDoDataManager sharedInstance]  getListCount];
    }
    return [[ToDoDataManager sharedInstance]  countNotDone];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myToDoCell" ];
    
    ToDoData *data = nil;
    if(self.showAll){
       data = [[ToDoDataManager sharedInstance] getCellDataAtIndex:indexPath.row];
    }else{
        data = [[ToDoDataManager sharedInstance] getCellNotDoneDataAtIndex:indexPath.row];
    }
    
    
    [cell setUpWithData:data];
    [cell setDelegate:self];
    
    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //TODO check identifier if adding more views
    DetailViewController *detailController = segue.destinationViewController;
    
    if(self.isCreating){
        
        //sends -1 to signify creating new task
        [detailController setDataIndex:-1];
        [detailController setEditData:YES];
    }else{
        
        //sends the index of the currently selected row
        [detailController setDataIndex:self.curRow];
        [detailController setEditData:NO];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [[ToDoDataManager sharedInstance] sortForDate];
    [self.tableView reloadData];
    
}
-(void)updateDataModel:(ToDoData*)data withBool:(BOOL)isDone{
    [[ToDoDataManager sharedInstance] updateDataModel:data withBool:isDone];
}




@end



