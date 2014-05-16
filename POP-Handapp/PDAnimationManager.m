//
//  PDAnimationManager.m
//  PopDemos
//
//  Created by kevinzhow on 14-5-16.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "PDAnimationManager.h"


@implementation PDAnimationManager

+(void)object:(CALayer*)layer configAnimation:(POPSpringAnimation *)animation WithType:(NSString *)type andAnimated:(BOOL)animated;
{
    //For scale
    if ([type isEqualToString:kPOPLayerScaleXY]) {
        if (animated) {
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
        }else{
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(2.0, 2.0)];
        }
    }else if ([type isEqualToString:kPOPLayerBackgroundColor])
    {
        if (animated) {
            animation.toValue = [UIColor purpleColor];
        }else{
            animation.toValue = [UIColor colorWithRed:0.16 green:0.72 blue:1 alpha:1];
        }
    }else if ([type isEqualToString:kPOPLayerBounds])
    {
        if (animated) {
            animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, 30)];
        }else{
            animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 150, 150)];
        }
    }else if ([type isEqualToString:kPOPLayerOpacity])
    {
        if (animated) {
            animation.toValue = @0;
        }else{
            animation.toValue = @1.0;
        }
    }else if ([type isEqualToString:kPOPLayerPosition])
    {
        if (animated) {
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(60, 150)];
        }else{
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(260, 150)];
        }
    }else if ([type isEqualToString:kPOPLayerRotation])
    {
        layer.cornerRadius = 10.0;
        if (animated) {
            animation.toValue = @(M_PI_2);
        }else{
            animation.toValue = @(0);
        }
    }else if ([type isEqualToString:kPOPLayerSize])
    {

        if (animated) {
            animation.toValue = [NSValue valueWithCGSize:CGSizeMake(50.0, 100.0)];
        }else{
            animation.toValue = [NSValue valueWithCGSize:CGSizeMake(50.0, 50)];
        }
    }else if ([type isEqualToString:kPOPLayerTranslationXY])
    {
        
        if (animated) {
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100.0f,0.0f)];
        }else{
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(-100.0f,0.0f)];
        }
    }else if ([type isEqualToString:kPOPLayerRotationX])
    {
        if (animated) {
            animation.toValue = @(M_PI_2);
        }else{
            animation.toValue = @(0);
        }
    }else if ([type isEqualToString:kPOPLayerRotationY])
    {
        if (animated) {
            animation.toValue = @(M_PI_2);
        }else{
            animation.toValue = @(0);
        }
    }
    
}

@end
