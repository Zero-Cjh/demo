//
//  Person.h
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import <Foundation/Foundation.h>
#import "Date.h"
@interface Person : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *gender;
@property (nonatomic) Date *data;

@end

