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
    [self performPopUpAnimation];
}

-(void)resetCircle
{
    [self.popCircle.layer pop_removeAllAnimations];
    
    self.popCircle.layer.opacity = 0.0;
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
        
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.popCircle.center.x, self.popCircle.center.y)];
    
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
