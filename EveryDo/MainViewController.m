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

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)ToDoDataManager *dataManager;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myToDoCell" ];
    
    return cell;

}





@end



