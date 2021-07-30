//
//  UserinfoTableViewCell.m
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import "UserinfoTableViewCell.h"
#import "UserinfoTableViewCellDatePickerView.h"
#import "UserinfoTableViewCellDatePickerViewToolBar.h"
@interface UserinfoTableViewCell()
@property (nonatomic,strong) UserinfoTableViewCellDatePickerView *userinfoTableViewCellDatePickerView;
@property (nonatomic,strong) UserinfoTableViewCellDatePickerViewToolBar *userinfoTableViewCellDatePickViewToolBar;
@end

@implementation UserinfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
//    [self.contentView addSubview:self.info];
//    [self.info mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(0);
//        make.left.mas_equalTo(self.mas_left).mas_offset(50);
//        make.size.mas_offset(CGSizeMake(60, 30));
//    }];
//    UIDatePicker *a = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    [self.contentView addSubview:a];
    [self.contentView addSubview:self.input];
    [self.input mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(0);
        make.right.mas_equalTo(self.mas_right).mas_offset(-20);
        make.size.mas_offset(CGSizeMake(100, 40));
    }];
}

- (void)setDatePickView{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //初始化格式器。
    [formatter setDateFormat:@"YYYY/MM/dd"];
    self.input.placeholder = [formatter stringFromDate:[NSDate date]];
    self.input.inputView = self.userinfoTableViewCellDatePickerView;
    [self.input setInputAccessoryView:self.userinfoTableViewCellDatePickViewToolBar];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

- (UILabel *)info{
    if (!_info) {
        _info = [[UILabel alloc]init];
    }
    return _info;
}
- (UITextField *)input{
    if (!_input) {
        _input = [[UITextField alloc]init];
        _input.placeholder=@"请输入";
        _input.delegate = self;
    }
    return _input;
}
- (UserinfoTableViewCellDatePickerView *)userinfoTableViewCellDatePickerView{
    if (!_userinfoTableViewCellDatePickerView) {
        _userinfoTableViewCellDatePickerView = [[UserinfoTableViewCellDatePickerView alloc]initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, 344)];
        __weak typeof (self) weakself = self;
        _userinfoTableViewCellDatePickerView.DateBlock = ^(Date *date) {
            weakself.input.text = [NSString stringWithFormat:@"%ld/%ld/%ld",date.year,date.month,date.day];
        };
        [_userinfoTableViewCellDatePickerView configUI];
        [_userinfoTableViewCellDatePickerView pickDate];
    }
    return _userinfoTableViewCellDatePickerView;
}

- (UserinfoTableViewCellDatePickerViewToolBar *)userinfoTableViewCellDatePickViewToolBar{
    if (!_userinfoTableViewCellDatePickViewToolBar) {
        _userinfoTableViewCellDatePickViewToolBar = [[UserinfoTableViewCellDatePickerViewToolBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        [_userinfoTableViewCellDatePickViewToolBar setBarStyle:UIBarStyleDefault];
        __weak typeof (self) weakself = self;
        _userinfoTableViewCellDatePickViewToolBar.sureButtonBlock = ^{
            [weakself endEditing:YES];
        };
        _userinfoTableViewCellDatePickViewToolBar.todayButtonBlock = ^{
            [weakself.userinfoTableViewCellDatePickerView skiptoday];
        };
    }
    return _userinfoTableViewCellDatePickViewToolBar;
}

@end
