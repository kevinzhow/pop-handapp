//
//  PDPropertyViewController.m
//  POP-Handapp
//
//  Created by kevinzhow on 14-5-17.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "PDPropertyViewController.h"

@interface PDPropertyViewController ()

@end

@implementation PDPropertyViewController

-(void)setAnimation
{
    self.animationTypes = @[kCAMediaTimingFunctionLinear,
                            kCAMediaTimingFunctionEaseIn,
                            kCAMediaTimingFunctionEaseOut,
                            kCAMediaTimingFunctionEaseInEaseOut,
                            kCAMediaTimingFunctionDefault];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView reloadData];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
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
    [self.countingLabel pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = 10.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:self.animationType];
    NSLog(@"Animation type is %@",self.animationType);
    
    POPAnimatableProperty * prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        // read value
        prop.readBlock = ^(id obj, CGFloat values[]) {
            values[0] = [[obj description] floatValue];
        };
        // write value
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            [obj setText:[NSString stringWithFormat:@"%.2f",values[0]]];
        };
        // dynamics threshold
        prop.threshold = 0.01;
    }];
    
    anim.property = prop;
    
    anim.fromValue = @(0.0);
    anim.toValue = @(100.0);
    
    [self.countingLabel pop_addAnimation:anim forKey:@"counting"];
}

- (IBAction)showEffects:(id)sender {

    
    if (self.tableView.center.y > 0) {
        [self hideTableView];
    }else{
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        anim.toValue = [NSValue valueWithCGPoint:self.view.center];
        [self.tableView pop_addAnimation:anim forKey:@"AnimationShow"];
    }
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y - 1000.0);
    [self.tableView setContentInset:UIEdgeInsetsMake(66,0,0,0)];
    [self.view addSubview:self.tableView];
    
    self.animationType = kCAMediaTimingFunctionEaseInEaseOut;
    [self setAnimation];
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
