//
//  UserinfoTableViewController.h
//  testnet
//
//  Created by jin10 on 2021/7/29.
//

#import <UIKit/UIKit.h>

#import "Person.h"

@interface UserinfoTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) void(^userlogonBlock)(Person *person);
@end

