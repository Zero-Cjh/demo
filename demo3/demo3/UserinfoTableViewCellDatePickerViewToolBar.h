//
//  UserinfoTableViewCellDatePickerViewToolBar.h
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import <UIKit/UIKit.h>

@interface UserinfoTableViewCellDatePickerViewToolBar : UIToolbar

@property (nonatomic) void(^sureButtonBlock)(void);
@property (nonatomic) void(^todayButtonBlock)(void);

@end
