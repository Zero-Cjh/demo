//
//  UserinfoTableViewCellDatePickerViewToolBar.m
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import "UserinfoTableViewCellDatePickerViewToolBar.h"

@interface UserinfoTableViewCellDatePickerViewToolBar()

@property (nonatomic,strong) NSMutableArray *barItems;
@property (nonatomic,strong) UIBarButtonItem *todayButton;
@property (nonatomic,strong) UIBarButtonItem *sureButton;
@property (nonatomic,strong) UIBarButtonItem *flexibleitem;

@end

@implementation UserinfoTableViewCellDatePickerViewToolBar

-(void)touchsureButtonaction{
    if (self.sureButtonBlock) {
        self.sureButtonBlock();
    }
}
-(void)touchtodayButtonaction{
    if (self.todayButtonBlock) {
        self.todayButtonBlock();
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.items = self.barItems;
    }
    return self;
}
- (UIBarButtonItem *)todayButton{
    if (!_todayButton) {
        _todayButton = [[UIBarButtonItem alloc] initWithTitle:@"今天" style:UIBarButtonItemStyleDone target:self action:@selector(touchtodayButtonaction)];
    }
    return _todayButton;
}
- (UIBarButtonItem *)sureButton{
    if (!_sureButton) {
        _sureButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(touchsureButtonaction)];
    }
    return _sureButton;
}
- (UIBarButtonItem *)flexibleitem{
    if (!_flexibleitem) {
        _flexibleitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemFlexibleSpace) target:self action:nil];
    }
    return _flexibleitem;
}
- (NSMutableArray *)barItems{
    if (!_barItems) {
        _barItems = [[NSMutableArray alloc]initWithObjects:self.todayButton,self.flexibleitem,self.sureButton, nil];
    }
    return _barItems;
}


@end
