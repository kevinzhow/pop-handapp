//
//  PDBasicViewController.m
//  POP-Handapp
//
//  Created by kevinzhow on 14-5-17.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "PDBasicViewController.h"
#import "PDAnimationManager.h"

@interface PDBasicViewController ()

@end

@implementation PDBasicViewController


- (void)setPopCircle
{
    self.popCircle = [CALayer layer];
    
    [self resetCircle];
    
    [self.view.layer addSublayer:self.popCircle];
    
    self.animationTypes = @[kCAMediaTimingFunctionLinear,
                            kCAMediaTimingFunctionEaseIn,
                            kCAMediaTimingFunctionEaseOut,
                            kCAMediaTimingFunctionEaseInEaseOut,
                            kCAMediaTimingFunctionDefault];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];
    
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
    self.popCircle.position = CGPointMake(self.view.center.x, 280.0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.animationTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [self.animationTypes objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.animationType = [self.animationTypes objectAtIndex:indexPath.row];
    [self hideTableView];
}

-(void)hideTableView
{
    [self resetCircle];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.window.center.x, -1000.0)];
    [self.tableView pop_addAnimation:anim forKey:@"AnimationHide"];
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
            [self performAnimation];
        }
    };
}
-(void)performAnimation
{
    
    [self.popCircle pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    if (self.animated) {
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    }else{
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(2.0, 2.0)];
    }
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:self.animationType];
    
    self.animated = !self.animated;
    

    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
            [self performAnimation];
        }
    };
    
    [self.popCircle pop_addAnimation:anim forKey:@"Animation"];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y - 1000.0);
    [self.tableView setContentInset:UIEdgeInsetsMake(66,0,0,0)];
    
    self.animationType = kCAMediaTimingFunctionEaseInEaseOut;
    [self setPopCircle];
    
    [self.view addSubview:self.tableView];
    
    [self performAnimation];
    
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showEffects:(id)sender {
    [self resetCircle];
    
    if (self.tableView.center.y > 0) {
        [self hideTableView];
    }else{
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        anim.toValue = [NSValue valueWithCGPoint:self.view.center];
        [self.tableView pop_addAnimation:anim forKey:@"AnimationShow"];
    }
    
    
}


@end
