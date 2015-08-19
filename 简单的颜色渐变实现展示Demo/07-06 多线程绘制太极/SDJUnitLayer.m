//
//  SDJUnitLayer.m
//  07-06 多线程绘制太极
//
//  Created by sj_imy on 15-7-21.
//  Copyright (c) 2015年 盛东. All rights reserved.
//

#import "SDJUnitLayer.h"
#import "SDJColorBox.h"
#import <UIKit/UIKit.h>

@implementation SDJUnitLayer

+ (instancetype)unitlayerWithRadius:(CGFloat)radius andSize:(CGFloat)size andTowards:(BOOL)rigthClock
{
    SDJUnitLayer *unit = [[SDJUnitLayer alloc]init];
    
    unit.bounds = CGRectMake(0, 0, size, size);
    
    unit.cornerRadius = unit.frame.size.width/2;
    unit.masksToBounds = YES;
    
    //color
    unit.backgroundColor = [self getPlamformColorWithProgress:size].CGColor;
    
    //positon
    unit.position = [unit pointFromAngle:radius andRadius:size andTowards:rigthClock];
    
    return unit;
}

+ (UIColor *)getPlamformColorWithProgress:(CGFloat)progress
{
    return [SDJColorBox colorWithProgress:((int)progress)%256];
}

- (CGPoint)pointFromAngle:(CGFloat)angle andRadius:(CGFloat)radius andTowards:(BOOL)rightClock
{
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width*0.5, [UIScreen mainScreen].bounds.size.height*0.5);
    
    CGFloat x;
    CGFloat y;
    
    switch ((int)(angle/M_PI_2)%4) {
        case 0:
            x = cos(angle)*radius + center.x;
            y = sin(angle)*radius + center.y;
            break;
        case 1:
            x = -cos(M_PI - angle)*radius + center.x;
            y = sin(M_PI - angle)*radius + center.y;
            break;
        case 2:
            x = -cos(angle - M_PI)*radius + center.x;
            y = -sin(angle - M_PI)*radius + center.y;
            break;
        case 3:
            x = cos(M_PI*2 - angle)*radius + center.x;
            y = -sin(M_PI*2 - angle)*radius + center.y;
            break;
    }
    
    NSLog(@"%f,%f",x,y);
    
    return CGPointMake(x, y);
}

@end
