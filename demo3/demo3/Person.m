//
//  Person.m
//  demo3
//
//  Created by jin10 on 2021/7/29.
//

#import "Person.h"

@implementation Person
- (BirthDate *)birthDate{
    if (!_birthDate) {
        _birthDate = [[BirthDate alloc]init];
    }
    return _birthDate;
}
@end
