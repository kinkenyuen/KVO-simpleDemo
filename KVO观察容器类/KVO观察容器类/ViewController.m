//
//  ViewController.m
//  KVO观察容器类
//
//  Created by Kinken_Yuen on 2018/11/18.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property(nonatomic,strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _p = [[Person alloc] init];
    [_p addObserver:self forKeyPath:@"arr" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [_p.arr addObject:@"kk"];   //不是通过set方法，没有触发KVO
    NSMutableArray *tmpArr = [_p mutableArrayValueForKey:@"arr"];   //原理是子类化NSMutableArray
    [tmpArr addObject:@"kk"];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",change);
    NSLog(@"%@",_p.arr);
}

- (void)dealloc
{
    [_p removeObserver:self forKeyPath:@"arr"];
}


@end
