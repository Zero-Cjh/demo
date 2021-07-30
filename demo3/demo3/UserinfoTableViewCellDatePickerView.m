//
//  UserinfoTableViewCellDatePickerView.m
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import "UserinfoTableViewCellDatePickerView.h"
@interface UserinfoTableViewCellDatePickerView()

@property (nonatomic,strong) BirthDate *birthDate;
@property (nonatomic,strong) NSMutableArray *year;
@property (nonatomic,strong) NSMutableArray *month;
@property (nonatomic,strong) NSMutableArray *day;
@end

@implementation UserinfoTableViewCellDatePickerView

-(void)configUI{
    self.delegate = self;
    self.dataSource = self;
    [self skiptoday];
    
}
- (void)pickDate{
    if (self.BirthDateBlock) {
        self.BirthDateBlock(self.birthDate);
    }
}
- (void)skiptoday{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //初始化格式器。
    [formatter setDateFormat:@"YYYY-MM-dd"];//定义时间为这种格式： YYYY-MM-dd hh:mm:ss 。
    self.birthDate.year = [[[formatter stringFromDate:[NSDate date]] substringToIndex:4] integerValue];
    self.birthDate.month = [[[formatter stringFromDate:[NSDate date]] substringWithRange:NSMakeRange(5,2)] integerValue];
    self.birthDate.day = [[[formatter stringFromDate:[NSDate date]] substringWithRange:NSMakeRange(8,2)] integerValue];
    [self changedaycountwithYear:self.birthDate.year andMonth:self.birthDate.month];
    [self selectRow:self.birthDate.year-1950 inComponent:0 animated:YES];
    [self selectRow:self.birthDate.month-1 inComponent:1 animated:YES];
    [self selectRow:self.birthDate.day-1 inComponent:2 animated:YES];
    [self pickDate];
}
- (void)changedaycountwithYear:(NSInteger)year andMonth:(NSInteger)month{
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            self.day = nil;
            for (int i=1; i<=31; i++) {
                [self.day addObject:[NSString stringWithFormat:@"%d",i]];
            }
            break;
        case 4: case 6: case 9: case 11:
            self.day = nil;
            for (int i=1; i<=30; i++) {
                [self.day addObject:[NSString stringWithFormat:@"%d",i]];
            }
            break;
        case 2:
            self.day = nil;
            if ((year%4)==0 && (year%400)!=0) {
                for (int i=1; i<=29; i++) {
                    [self.day addObject:[NSString stringWithFormat:@"%d",i]];
                }
            }else{
                for (int i=1; i<=28; i++) {
                    [self.day addObject:[NSString stringWithFormat:@"%d",i]];
                }
            }
            break;
        default:
            break;
    }
    if (self.birthDate.day > self.day.count) {
        self.birthDate.day = self.day.count;
    }
    [self reloadComponent:2];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:
            self.birthDate.year = row+1950;
            [self changedaycountwithYear:self.birthDate.year andMonth:self.birthDate.month];
            break;
        case 1:
            self.birthDate.month = row+1;
            [self changedaycountwithYear:self.birthDate.year andMonth:self.birthDate.month];
            break;
        case 2:
            self.birthDate.day = row+1;
            break;
    }
    [self pickDate];
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
            return nil;
            break;
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
- (BirthDate *)birthDate{
    if (!_birthDate) {
        _birthDate = [[BirthDate alloc]init];
        
    }
    return _birthDate;
}
- (NSMutableArray *)year{
    if (!_year) {
        _year = [[NSMutableArray alloc]init];
        for (int i=1950; i<=self.birthDate.year; i++) {
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
    }
    return _day;
}
- (void)adddayarray{
    for (int i=1; i<=31; i++) {
        [self.day addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

@end
