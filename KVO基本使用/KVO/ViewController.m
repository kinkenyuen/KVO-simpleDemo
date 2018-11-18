//
//  ViewController.m
//  KVO
//
//  Created by Kinken_Yuen on 2018/11/7.
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
    
    [_p addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:NSKeyValueObservingOptionNew context:@"PersonOB"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _p.name = @"kin";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@",keyPath);
    NSLog(@"%@",object);
    NSLog(@"%@",change);
    NSLog(@"%@",context);
}

- (void)dealloc
{
    [_p removeObserver:self forKeyPath:NSStringFromSelector(@selector(name))];
}


@end
