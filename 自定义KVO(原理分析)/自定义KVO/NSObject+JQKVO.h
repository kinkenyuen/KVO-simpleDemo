//
//  NSObject+JQKVO.h
//  自定义KVO
//
//  Created by Kinken_Yuen on 2018/11/18.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JQKVO)

- (void)JQ_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

@end

NS_ASSUME_NONNULL_END
