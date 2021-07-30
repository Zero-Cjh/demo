//
//  ShowinfoTableViewController.m
//  demo3
//
//  Created by jin10 on 2021/7/30.
//

#import "ShowinfoTableViewController.h"
#import "UserinfoTableViewController.h"
#import "BirthDate.h"
@interface ShowinfoTableViewController ()
@property (nonatomic) UserinfoTableViewController *userinfoTableViewController;
@property (nonatomic) NSMutableArray *userArray;
@end

@implementation ShowinfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self confignavigation];
    [self configtableview];
}

- (void)configtableview{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.userArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text = [[self.userArray objectAtIndex:indexPath.row] name];
    BirthDate *birthDate =[[self.userArray objectAtIndex:indexPath.row] birthDate];
    NSString *datestr = [NSString stringWithFormat:@"%ld/%ld/%ld",birthDate.year,birthDate.month,birthDate.day];
    cell.detailTextLabel.text = datestr;
    return cell;
}
-(void)confignavigation{
    self.navigationItem.title = @"userinfo";
    self.navigationController.navigationBar.barTintColor = [UIColor systemBackgroundColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"logon" style:UIBarButtonItemStylePlain target:self action:@selector(logon)];
}
-(void)logon{
    [self.navigationController pushViewController:self.userinfoTableViewController animated:YES];
}
- (UserinfoTableViewController *)userinfoTableViewController{
    if (!_userinfoTableViewController) {
        _userinfoTableViewController = [[UserinfoTableViewController alloc]init];
        __weak typeof(self) weakself = self;
        _userinfoTableViewController.userlogonBlock = ^(Person *person) {
            [weakself.userArray addObject:person];
            [weakself.tableView reloadData];
        };
    }
    return _userinfoTableViewController;
}
- (NSMutableArray *)userArray{
    if (!_userArray) {
        _userArray = [[NSMutableArray alloc]init];
    }
    return _userArray;
}

@end
