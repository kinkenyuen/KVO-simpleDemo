//
//  Person.h
//  KVO
//
//  Created by Kinken_Yuen on 2018/11/7.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)Dog *dog;

@end

NS_ASSUME_NONNULL_END
