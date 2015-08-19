//
//  SDJUnitLayer.h
//  07-06 多线程绘制太极
//
//  Created by sj_imy on 15-7-21.
//  Copyright (c) 2015年 盛东. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SDJUnitLayer : CALayer

+ (instancetype)unitlayerWithRadius:(CGFloat)radius andSize:(CGFloat)size andTowards:(BOOL)rigthClock;

@end
