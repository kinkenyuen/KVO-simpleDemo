//
//  Person.h
//  KVO观察容器类
//
//  Created by Kinken_Yuen on 2018/11/18.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic,copy) NSString *name;

@property(nonatomic,strong) NSMutableArray *arr;


@end

NS_ASSUME_NONNULL_END
