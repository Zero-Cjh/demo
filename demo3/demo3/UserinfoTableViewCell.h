//
//  UserinfoTableViewCell.h
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
@interface UserinfoTableViewCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic,strong) UILabel *info;
@property (nonatomic,strong) UITextField *input;
-(void)setDatePickView;
@end

