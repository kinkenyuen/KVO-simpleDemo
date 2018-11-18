//
//  ViewController.m
//  自定义KVO
//
//  Created by Kinken_Yuen on 2018/11/18.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

/**
 1.添加观察者的时候子类化被观察者，通过修改isa指针
 2.重写set方法做通知观察者的操作
 */

#import "ViewController.h"
#import "Person.h"
#import "NSObject+JQKVO.h"

@interface ViewController ()
@property(nonatomic,strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _p = [[Person alloc] init];
    _p.name = @"ken";
    [_p JQ_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int a;
    _p.name = [@"ken" stringByAppendingFormat:@"%d",a++];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@",change);
}

- (void)dealloc
{
    [_p removeObserver:self forKeyPath:@"name"];
}


@end
