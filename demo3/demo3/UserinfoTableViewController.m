//
//  UserinfoTableViewController.m
//  testnet
//
//  Created by jin10 on 2021/7/29.
//

#import "UserinfoTableViewController.h"
#import "UserinfoTableViewCell.h"
@interface UserinfoTableViewController ()
@property (nonatomic) Person *person;
@property (nonatomic) UITextField *name;
@property (nonatomic) UITextField *gender;
@property (nonatomic) UITextField *date;
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
    self.navigationItem.title = @"userlogon";
    self.navigationController.navigationBar.barTintColor = [UIColor systemBackgroundColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"logon" style:UIBarButtonItemStylePlain target:self action:@selector(NSLoguserinfo)];
}

-(void)NSLoguserinfo{
    self.person.name = _name.text;
    self.person.gender = _gender.text;
    self.person.birthDate.year = [[_date.text substringToIndex:4] integerValue];
    self.person.birthDate.month = [[_date.text substringWithRange:NSMakeRange(5,2)] integerValue];
    self.person.birthDate.day = [[_date.text substringWithRange:NSMakeRange(8,2)] integerValue];
    NSLog(@"%ld",self.person.birthDate.year);
    NSLog(@"%ld",[[_date.text substringToIndex:4] integerValue]);
    if (self.userlogonBlock) {
        self.userlogonBlock(self.person);
        [self.navigationController popViewControllerAnimated:YES];
    }
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
            _name = cell.input;
            
            break;
        case 1:
            cell.textLabel.text = @"性别";
            _gender = cell.input;
            break;
        case 2:
            cell.textLabel.text = @"出生年月日";
            [cell setDatePickView];
            _date = cell.input;
            break;
        default:
            break;
    }
    return cell;
}
- (Person *)person{
    if (!_person) {
        _person = [[Person alloc]init];
    }
    return _person;
}

@end
