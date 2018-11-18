//
//  Person.m
//  KVO
//
//  Created by Kinken_Yuen on 2018/11/7.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "Person.h"


@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dog = [[Dog alloc] init];
    }
    return self;
}

/**
 返回属性集合让观察者监听

 @param key 外界监听了的key
 @return 属性集合
 */
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    
    //添加属性依赖，如果外部需要监听Person的Dog属性内部的多个属性
    if ([key isEqualToString:@"dog"]) {
        keyPaths = [[NSSet alloc] initWithObjects:@"_dog.age",@"_dog.level", nil];
    }
    return keyPaths;
}

//+ (NSSet<NSString *> *)keyPathsForValuesAffectingDependentKey
//{
//    return [NSSet setWithObjects:@"<#keyPath#>", nil];
//}

@end
