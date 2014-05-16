//
//  PDDecayViewController.m
//  PopDemos
//
//  Created by kevinzhow on 14-5-16.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "PDDecayViewController.h"

@interface PDDecayViewController ()

@end

@implementation PDDecayViewController

- (void)setPopCircle
{
    self.title = @"POP Circle";
    self.popCircle = [CALayer layer];
    
    [self resetCircle];
    
    [self.view.layer addSublayer:self.popCircle];
    
//    self.animationTypes = @[kPOPLayerBackgroundColor,kPOPLayerBounds,kPOPLayerOpacity,kPOPLayerPosition,kPOPLayerRotation,
//                            kPOPLayerScaleXY,kPOPLayerSize,kPOPLayerTranslationXY,kPOPLayerRotationX, kPOPLayerRotationY];
//    
//    
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    [self.tableView reloadData];
    
}

-(void)resetCircle
{
    [self.popCircle pop_removeAllAnimations];
    self.popCircle.opacity = 1.0;
    self.popCircle.transform = CATransform3DIdentity;
    [self.popCircle setMasksToBounds:YES];
    [self.popCircle setBackgroundColor:[UIColor colorWithRed:0.16 green:0.72 blue:1 alpha:1].CGColor];
    [self.popCircle setCornerRadius:25.0f];
    [self.popCircle setBounds:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    self.popCircle.position = CGPointMake(self.view.center.x, 180.0);
}

-(void)setAnimationWithDeceleration:(CGFloat)deceleration
{
    
    [self.popCircle pop_removeAllAnimations];
    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anim.velocity = @(10.);
    
    self.animated = !self.animated;
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
            [self performAnimation];
        }
    };
    

    [self.popCircle pop_addAnimation:anim forKey:@"slide"];
}

-(void)performAnimation
{
    [self setAnimationWithDeceleration:self.decelerationSlider.value];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setPopCircle];
    [self performAnimation];
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
