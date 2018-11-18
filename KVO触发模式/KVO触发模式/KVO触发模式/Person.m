//
//  Person.m
//  KVO
//
//  Created by Kinken_Yuen on 2018/11/7.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "Person.h"

@implementation Person
/**
 修改触发模式
 默认返回YES：自动触发
 NO：手动触发
 @param key key description
 @return return value description
 */
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    return YES;
}
@end
