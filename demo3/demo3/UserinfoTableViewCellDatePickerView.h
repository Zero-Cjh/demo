//
//  UserinfoTableViewCellDatePickerView.h
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import <UIKit/UIKit.h>
#import "BirthDate.h"
#import <Masonry.h>
@interface UserinfoTableViewCellDatePickerView : UIPickerView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,copy) void(^BirthDateBlock)(BirthDate *BirthDate);
- (void)configUI;
- (void)pickDate;
- (void)skiptoday;
@end

