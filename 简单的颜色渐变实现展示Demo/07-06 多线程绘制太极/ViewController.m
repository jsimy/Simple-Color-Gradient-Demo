//
//  ViewController.m
//  07-06 多线程绘制太极
//
//  Created by sj_imy on 15-7-6.
//  Copyright (c) 2015年 盛东. All rights reserved.
//

#import "ViewController.h"
#import "SDJUnitLayer.h"

@interface ViewController ()

//@property (nonatomic, assign)CGFloat radiusAngle;
@property (nonatomic, assign)BOOL towards;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    self.radiusAngle+=0.1;
    
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(startToAnimating) object:nil];
    [thread start];
}

- (void)startToAnimating
{
    CGFloat i = 1;
    while (i <756) {
        [self performSelectorOnMainThread:@selector(drawWithSize:) withObject:[NSNumber numberWithFloat:i] waitUntilDone:YES];
        
        [NSThread sleepForTimeInterval:0.02];
        
        i += 0.7;
    }
}

- (void)drawWithSize:(NSNumber *)size
{
    [self.view.layer addSublayer:[SDJUnitLayer unitlayerWithRadius:size.floatValue*15 andSize:size.floatValue andTowards:self.towards]];
}

@end
