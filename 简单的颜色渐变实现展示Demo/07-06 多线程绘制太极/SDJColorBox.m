//
//  SDJColorBox.m
//  07-06 多线程绘制太极
//
//  Created by sj_imy on 15-7-21.
//  Copyright (c) 2015年 盛东. All rights reserved.
//

#import "SDJColorBox.h"

@implementation SDJColorBox

+ (UIColor *)colorWithProgress:(CGFloat)progress
{
    SDJColorBox *colorBox = [[SDJColorBox alloc]init];
    
    UIColor *flexColor = [[UIColor alloc]init];
    
    int currentProgress = ((int)progress*6)%252;
    
    switch ((int)progress/42) {
        case 0:
            flexColor = [colorBox flexRedColorWithProgress:currentProgress];
            break;
        case 1:
            flexColor = [colorBox flexPurpleWithProgress:currentProgress];
            break;
        case 2:
            flexColor = [colorBox flexBlueColorWithProgress:currentProgress];
            break;
        case 3:
            flexColor = [colorBox flexCyanColorWithProgress:currentProgress];
            break;
        case 4:
            flexColor = [colorBox flexGreenColorWithProgress:currentProgress];
            break;
        case 5:
            flexColor = [colorBox flexOrangeColorWithProgress:currentProgress];
            break;
            
        default:
            flexColor = [UIColor redColor];
            break;
    }
    return flexColor;
}

- (UIColor *)flexRedColorWithProgress:(CGFloat)progress
{
    return [UIColor colorWithRed:255/256.0 green:0 blue:progress/256.0 alpha:1];
}

- (UIColor *)flexPurpleWithProgress:(CGFloat)progress
{
    return [UIColor colorWithRed:(255 - progress)/256.0 green:0 blue:255/256.0 alpha:1];
}

- (UIColor *)flexBlueColorWithProgress:(CGFloat)progress
{
    return [UIColor colorWithRed:0 green:progress/256.0 blue:255/256.0 alpha:1];
}

- (UIColor *)flexCyanColorWithProgress:(CGFloat)progress
{
    return [UIColor colorWithRed:0 green:255/256.0 blue:(255 - progress)/256.0 alpha:1];
}

- (UIColor *)flexGreenColorWithProgress:(CGFloat)progress
{
    return [UIColor colorWithRed:progress/256.0 green:255/256.0 blue:0 alpha:1];
}

- (UIColor *)flexOrangeColorWithProgress:(CGFloat)progress
{
    return [UIColor colorWithRed:255/256.0 green:(255 - progress)/256.0 blue:0 alpha:1];
}

@end
