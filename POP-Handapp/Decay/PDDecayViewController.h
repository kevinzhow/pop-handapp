//
//  PDDecayViewController.h
//  PopDemos
//
//  Created by kevinzhow on 14-5-16.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <POP/POP.h>

@interface PDDecayViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView * tableView;

@property (nonatomic) UIView * popCircle;
@property (nonatomic) BOOL animated;
@property (nonatomic) NSString * animationType;
@property (nonatomic) NSArray * animationTypes;
@property (weak, nonatomic) IBOutlet UISlider *decelerationSlider;
@property (weak, nonatomic) IBOutlet UISlider *velocitySlider;


- (IBAction)slideChanged:(id)sender;
- (IBAction)showEffects:(id)sender;

@end
