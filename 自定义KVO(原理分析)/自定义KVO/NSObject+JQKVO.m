//
//  NSObject+JQKVO.m
//  自定义KVO
//
//  Created by Kinken_Yuen on 2018/11/18.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "NSObject+JQKVO.h"
#import <objc/message.h>

@implementation NSObject (JQKVO)
- (void)JQ_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    //1.创建一个类
    NSString *oldClassName = NSStringFromClass(self.class);
    NSString *newClassName = [@"JQKVO_" stringByAppendingString:oldClassName];
    Class MyClass = objc_allocateClassPair(self.class, [newClassName UTF8String], 0);
    //1.1 注册类
    objc_registerClassPair(MyClass);
    
    //2.重写set方法(添加set方法)
    class_addMethod(MyClass, @selector(setName:), (IMP)setName, "v@:@");
    
    //3.修改isa指针（将当前类实例的isa指针指向新生成的类）
    object_setClass(self, MyClass);
    
    //4.将observer保存到当前对象(这里场景是person)
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_ASSIGN);
}

void setName(id self,SEL _cmd,NSString *name) {
    //调用父类set方法
    Class class = [self class]; //JQKVO_Person类
    object_setClass(self, class_getSuperclass(class)); //将对象的isa指针改回指向Person类
    objc_msgSend(self, @selector(setName:),name);
    
    //拿到观察者
    id observer = objc_getAssociatedObject(self, @"observer");
    if (observer) {
        objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:),@"name",self,@{@"name":name,@"kind":@1},nil);
    }
    
    object_setClass(self, class);
}

@end
