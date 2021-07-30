//
//  UserinfoTableViewCellDatePickerView.h
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import <UIKit/UIKit.h>
#import "Date.h"
#import <Masonry.h>
@interface UserinfoTableViewCellDatePickerView : UIPickerView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,copy) void(^DateBlock)(NSString *date);
-(void)configUI;

@end

