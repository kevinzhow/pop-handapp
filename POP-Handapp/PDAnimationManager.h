//
//  PDAnimationManager.h
//  PopDemos
//
//  Created by kevinzhow on 14-5-16.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <POP/POP.h>

@interface PDAnimationManager : NSObject

+(void)object:(CALayer*)layer configAnimation:(POPSpringAnimation *)animation WithType:(NSString *)type andAnimated:(BOOL)animated;

@end
