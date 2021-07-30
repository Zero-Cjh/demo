//
//  UserinfoTableViewCellDatePickerView.m
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import "UserinfoTableViewCellDatePickerView.h"
@interface UserinfoTableViewCellDatePickerView()

@property (nonatomic,strong) Date *date;
@property (nonatomic,strong) NSMutableArray *year;
@property (nonatomic,strong) NSMutableArray *month;
@property (nonatomic,strong) NSMutableArray *day;
@end

@implementation UserinfoTableViewCellDatePickerView

-(void)configUI{
    self.delegate = self;
    self.dataSource = self;
    
    [self date];
    

}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return self.year.count;
            break;
        case 1:
            return self.month.count;
            break;
        case 2:
            return self.day.count;
            break;
        default:
            return 1;
            break;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return [self.year objectAtIndex:row];
            break;
        case 1:
            return [self.month objectAtIndex:row];
            break;
        case 2:
            return [self.day objectAtIndex:row];
            break;
        default:
            return @"NULL";
            break;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:
            self.date.year = row+1950;
            break;
        case 1:
            self.date.month = row+1;
            break;
        case 2:
            self.date.day = row+1;
            break;
    }
    if (self.DateBlock) {
        self.DateBlock([NSString stringWithFormat:@"%ld/%ld/%ld",self.date.year,self.date.month,self.date.day]);
    }
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30;
}
- (NSMutableArray *)year{
    if (!_year) {
        _year = [[NSMutableArray alloc]init];
        for (int i=1950; i<=2050; i++) {
            [_year addObject:[NSString stringWithFormat:@"%d",i]];
        }
       
    }
    return _year;
}
- (NSMutableArray *)month{
    if (!_month) {
        _month = [[NSMutableArray alloc]init];
        for (int i=1; i<=12; i++) {
            [_month addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _month;
}
- (NSMutableArray *)day{
    if (!_day) {
        _day = [[NSMutableArray alloc]init];
        for (int i=1; i<=31; i++) {
            [_day addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _day;
}
- (Date *)date{
    if (!_date) {
        _date = [[Date alloc]init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //初始化格式器。
        [formatter setDateFormat:@"YYYY-MM-dd"];//定义时间为这种格式： YYYY-MM-dd hh:mm:ss 。
        _date.year = [[[formatter stringFromDate:[NSDate date]] substringToIndex:4] intValue];
        _date.month = [[[formatter stringFromDate:[NSDate date]] substringWithRange:NSMakeRange(5,2)] intValue];
        _date.day = [[[formatter stringFromDate:[NSDate date]] substringWithRange:NSMakeRange(8,2)] intValue];
        [self selectRow:_date.year-1950 inComponent:0 animated:nil];
        [self selectRow:_date.month-1 inComponent:1 animated:YES];
        [self selectRow:_date.day-1 inComponent:2 animated:YES];
        
    }
    
    return _date;
}


@end
