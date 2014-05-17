//
//  PDUsageViewController.m
//  POP-Handapp
//
//  Created by kevinzhow on 14-5-17.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "PDUsageViewController.h"

@interface PDUsageViewController ()

@end

@implementation PDUsageViewController

- (void)setPopCircle
{
    self.title = @"POP Circle";
    self.popCircle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    [self resetCircle];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.popCircle addGestureRecognizer:pan];
    
    [self.view addSubview:self.popCircle];

}

- (IBAction)animateAction:(id)sender {
    [self resetCircle];
    if ([self.animationType isEqualToString:@"POPUP"]) {
        [self performPopUpAnimation];
    }else if ([self.animationType isEqualToString:@"FLYIN"])
    {
        [self performFlyInAnimation];
    }else if ([self.animationType isEqualToString:@"TRANSFORM"])
    {
        [self performTransactionAnimation];
    }
    
}

-(void)resetCircle
{
    [self.popCircle.layer pop_removeAllAnimations];
    for (CAShapeLayer *layer in self.popCircle.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    
    self.popCircle.layer.opacity = 0.0;
    if ([self.animationType isEqualToString:@"TRANSFORM"]) {
         self.popCircle.layer.opacity = 1.0;
    }
    self.popCircle.layer.transform = CATransform3DIdentity;
    [self.popCircle.layer setMasksToBounds:YES];
    [self.popCircle.layer setBackgroundColor:[UIColor colorWithRed:0.16 green:0.72 blue:1.0 alpha:1.0].CGColor];
    [self.popCircle.layer setCornerRadius:25.0f];
    [self.popCircle setBounds:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    self.popCircle.layer.position = CGPointMake(self.view.center.x, 180.0);

}


- (void)handlePan:(UIPanGestureRecognizer *)pan {
	switch (pan.state) {
		case UIGestureRecognizerStateBegan:
		case UIGestureRecognizerStateChanged: {
            [self.popCircle.layer pop_removeAllAnimations];
            
			CGPoint translation = [pan translationInView:self.view];
            
			CGPoint center = self.popCircle.center;
			center.x += translation.x;
			center.y += translation.y;
			self.popCircle.center = center;
            
			[pan setTranslation:CGPointZero inView:self.popCircle];
			break;
		}
            
		case UIGestureRecognizerStateEnded:
		case UIGestureRecognizerStateCancelled: {
            
            CGPoint velocity = [pan velocityInView:self.view];
            [self addDecayPositionAnimationWithVelocity:velocity];
            break;
		}
            
		default:
			break;
	}
}

-(void)addDecayPositionAnimationWithVelocity:(CGPoint)velocity
{
    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
    
    anim.velocity = [NSValue valueWithCGPoint:CGPointMake(velocity.x, velocity.y)];
    
    
    anim.deceleration = 0.998;
    
    [self.popCircle.layer pop_addAnimation:anim forKey:@"AnimationPosition"];
}

-(void)performPopUpAnimation
{
    
    [self.popCircle pop_removeAllAnimations];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.springBounciness = 10;
    anim.springSpeed = 20;
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(2.0, 2.0)];
    
    POPBasicAnimation *opacityAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    
    opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacityAnim.duration = 0.3;
    opacityAnim.toValue = @1.0;
    
    [self.popCircle.layer pop_addAnimation:anim forKey:@"AnimationScale"];
    [self.popCircle.layer pop_addAnimation:opacityAnim forKey:@"AnimateOpacity"];
}

-(void)performFlyInAnimation
{
    [self.popCircle pop_removeAllAnimations];
    
    [self.popCircle.layer setCornerRadius:5.0f];
    [self.popCircle setBounds:CGRectMake(0.0f, 0.0f, 160.0f, 230.0f)];
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(-M_PI_4/8.0);
    [self.popCircle.layer setAffineTransform:rotateTransform];
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.springBounciness = 6;
    anim.springSpeed = 10;
    anim.fromValue = @-200;
    anim.toValue = @(self.view.center.y);
    
    POPBasicAnimation *opacityAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    
    opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacityAnim.duration = 0.25;
    opacityAnim.toValue = @1.0;
    
    POPBasicAnimation *rotationAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    
    rotationAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnim.beginTime = CACurrentMediaTime() + 0.1;
    rotationAnim.duration = 0.3;
    rotationAnim.toValue = @(0);
    
    [self.popCircle.layer pop_addAnimation:anim forKey:@"AnimationScale"];
    [self.popCircle.layer pop_addAnimation:opacityAnim forKey:@"AnimateOpacity"];
    [self.popCircle.layer pop_addAnimation:rotationAnim forKey:@"AnimateRotation"];
}


-(void)performTransactionAnimation
{
    [self.popCircle pop_removeAllAnimations];

    
    //Config progress line
    CAShapeLayer *progressLayer = [CAShapeLayer layer];
    progressLayer.strokeColor = [UIColor colorWithWhite:1.0 alpha:0.98].CGColor;
    progressLayer.lineCap   = kCALineCapRound;
    progressLayer.lineJoin  = kCALineJoinBevel;
    progressLayer.lineWidth = 26.0;
    progressLayer.strokeEnd = 0.0;
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline moveToPoint:CGPointMake(25.0, 25.0)];
    [progressline addLineToPoint:CGPointMake(700.0, 25.0)];
    progressLayer.path = progressline.CGPath;
    
    [self.popCircle.layer addSublayer:progressLayer];
    //

    POPSpringAnimation *scaleAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnim.springBounciness = 5;
    scaleAnim.springSpeed = 12;
    scaleAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(0.3, 0.3)];
    
    POPSpringAnimation *boundsAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    boundsAnim.springBounciness = 10;
    boundsAnim.springSpeed = 6;
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 800, 50)];
    
    boundsAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
            UIGraphicsBeginImageContextWithOptions(self.popCircle.frame.size, NO, 0.0);
            POPBasicAnimation *progressBoundsAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
            progressBoundsAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            progressBoundsAnim.duration = 1.0;
            progressBoundsAnim.fromValue = @0.0;
            progressBoundsAnim.toValue = @1.0;
            
            [progressLayer pop_addAnimation:progressBoundsAnim forKey:@"AnimateBounds"];
            progressBoundsAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
                if (finished) {
                    UIGraphicsEndImageContext();
                }
            };
            
            
        }
    };
    
    [self.popCircle.layer pop_addAnimation:boundsAnim forKey:@"AnimateBounds"];
    [self.popCircle.layer pop_addAnimation:scaleAnim forKey:@"AnimateScale"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setPopCircle];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
