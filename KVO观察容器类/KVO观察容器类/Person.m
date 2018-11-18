//
//  Person.m
//  KVO观察容器类
//
//  Created by Kinken_Yuen on 2018/11/18.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "Person.h"

@implementation Person
- (NSMutableArray *)arr {
    if (!_arr) {
        _arr =NSMutableArray.array;
    }
    return _arr;
}
@end
