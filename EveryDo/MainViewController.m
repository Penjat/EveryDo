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
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[ToDoDataManager sharedInstance] sortForLeastUrgent];
    
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
    return [[ToDoDataManager sharedInstance]  getListCount];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myToDoCell" ];
    ToDoData *data = [[ToDoDataManager sharedInstance] getCellDataAtIndex:indexPath.row];
    
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
    [[ToDoDataManager sharedInstance] sortForLeastUrgent];
    [self.tableView reloadData];
    
}
-(void)updateDataModel:(ToDoData*)data withBool:(BOOL)isDone{
    [[ToDoDataManager sharedInstance] updateDataModel:data withBool:isDone];
}




@end



