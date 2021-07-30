//
//  UserinfoTableViewController.m
//  testnet
//
//  Created by jin10 on 2021/7/29.
//

#import "UserinfoTableViewController.h"
#import "UserinfoTableViewCell.h"
@interface UserinfoTableViewController ()
@end

@implementation UserinfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self confignavigation];
    [self configtableView];
}

-(void)configtableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
}
-(void)confignavigation{
    self.navigationItem.title = @"userinfo";
    self.navigationController.navigationBar.barTintColor = [UIColor systemBackgroundColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"NSLog" style:UIBarButtonItemStylePlain target:self action:@selector(NSLoguserinfo)];
}

-(void)NSLoguserinfo{
    NSLog(@"a");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell
    UserinfoTableViewCell *cell = [[UserinfoTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"姓名";
            break;
        case 1:
            cell.textLabel.text = @"性别";
            break;
        case 2:
            cell.textLabel.text = @"出生年月日";
            [cell setDatePickView];
            break;
        default:
            break;
    }
//    
////    cell.textLabel.text = @"aa";
//    cell.detailTextLabel.text = @"副标题";
    return cell;
}


@end
