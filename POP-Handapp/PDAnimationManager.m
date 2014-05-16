//
//  PDAnimationManager.m
//  PopDemos
//
//  Created by kevinzhow on 14-5-16.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "PDAnimationManager.h"


@implementation PDAnimationManager

+(void)springObject:(CALayer*)layer configAnimation:(POPPropertyAnimation *)animation WithType:(NSString *)type andAnimated:(BOOL)animated
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

+(void)decayObject:(CALayer*)layer configAnimation:(POPDecayAnimation *)animation WithType:(NSString *)type andAnimated:(BOOL)animated andVelocitySlider:(UISlider *)slider;
{

    //For scale
    if ([type isEqualToString:kPOPLayerScaleXY]) {
        if (animated) {
            animation.velocity = [NSValue valueWithCGSize:CGSizeMake(-slider.value/100.0, -slider.value/100.0)];
        }else{
            animation.velocity = [NSValue valueWithCGSize:CGSizeMake(slider.value/100.0, slider.value/100.0)];
            animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0.5, 0.5)];
        }
        
            
    }else if ([type isEqualToString:kPOPLayerBackgroundColor])
    {
        if (animated) {
            animation.velocity = [UIColor colorWithRed:-slider.value/100.0 green:-slider.value/200.0 blue:-slider.value/300.0 alpha:1.0];
        }else{
            animation.velocity = [UIColor colorWithRed:slider.value/100.0 green:slider.value/200.0 blue:slider.value/300.0 alpha:1.0];
            animation.fromValue  = [UIColor colorWithRed:0.2 green:0.1 blue:0.3 alpha:1];
        }
        
    }else if ([type isEqualToString:kPOPLayerBounds])
    {
        if (animated) {
            animation.velocity = [NSValue valueWithCGRect:CGRectMake(0, 0, -slider.value, -slider.value)];
        }else{
            animation.velocity = [NSValue valueWithCGRect:CGRectMake(0, 0, slider.value, slider.value)];
            animation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50.0, 50.0)];
        }
        
        
    }else if ([type isEqualToString:kPOPLayerOpacity])
    {
        if (animated) {
            animation.velocity = @(-slider.value/50.0);
        }else{
            animation.velocity = @(slider.value/50.0);
            
            animation.fromValue = @0.0;
        }
        

    }else if ([type isEqualToString:kPOPLayerPosition])
    {
        if (animated) {
            animation.velocity = [NSValue valueWithCGPoint:CGPointMake(-slider.value, -slider.value)];
        }else{
            animation.velocity = [NSValue valueWithCGPoint:CGPointMake(slider.value, slider.value)];
            
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(160, 150)];
        }
        

    }else if ([type isEqualToString:kPOPLayerPositionX])
    {
        if (animated) {
            animation.velocity = @(-slider.value);
        }else{
            animation.velocity = @(slider.value);
            animation.fromValue =  @(25.0);
        }
        
        
    }else if ([type isEqualToString:kPOPLayerRotation])
    {
        layer.cornerRadius = 10.0;
        if (animated) {
            animation.velocity = @(-slider.value);
        }else{
            animation.velocity = @(slider.value);
            animation.fromValue = @(M_PI_2);
        }
        
    }else if ([type isEqualToString:kPOPLayerSize])
    {
       
        
        if (animated) {
            animation.velocity =  [NSValue valueWithCGSize:CGSizeMake(-slider.value/10.0, -slider.value*3)];
        }else{
            animation.velocity =  [NSValue valueWithCGSize:CGSizeMake(slider.value/10.0, slider.value*3)];
            animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(50.0, 50.0)];
        }
    }else if ([type isEqualToString:kPOPLayerTranslationXY])
    {
        
        if (animated) {
            animation.velocity =  [NSValue valueWithCGPoint:CGPointMake(-slider.value, -slider.value)];
        }else{
            animation.velocity =  [NSValue valueWithCGPoint:CGPointMake(slider.value, slider.value)];
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0.0f,0.0f)];
        }
    }else if ([type isEqualToString:kPOPLayerRotationX])
    {
        
        if (animated) {
            animation.velocity = @(-slider.value/10.0);
        }else{
            animation.velocity = @(slider.value/10.0);
            animation.fromValue = @(0);
        }
        
        
    }else if ([type isEqualToString:kPOPLayerRotationY])
    {
        if (animated) {
            animation.velocity = @(-slider.value/10.0);
        }else{
            animation.velocity = @(slider.value/10.0);
            animation.fromValue = @(0);
        }
    }
    
}

@end
