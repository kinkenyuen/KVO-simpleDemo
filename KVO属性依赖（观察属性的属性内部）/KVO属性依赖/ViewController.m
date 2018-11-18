//
//  ViewController.m
//  KVO属性依赖
//
//  Created by Kinken_Yuen on 2018/11/18.
//  Copyright © 2018年 Kinken_Yuen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property(nonatomic,strong)Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _p = [[Person alloc] init];
    _p.name = @"ken";
    
    [_p addObserver:self forKeyPath:@"dog" options:NSKeyValueObservingOptionNew context:@"PersonOB"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int a,b;
    _p.dog.age = a++;
    _p.dog.level = b++;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
//    NSLog(@"%@",keyPath);
//    NSLog(@"%@",object);
    NSLog(@"%@",change);
//    NSLog(@"%@",context);
}

- (void)dealloc
{
    [_p removeObserver:self forKeyPath:NSStringFromSelector(@selector(name))];
}


@end
