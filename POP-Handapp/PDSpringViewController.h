//
//  PDSpingViewController.h
//  PopDemos
//
//  Created by kevinzhow on 14-5-14.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <POP/POP.h>


@interface PDSpringViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

-(void)setPopCircle;

@property (weak, nonatomic) IBOutlet UISlider *bouncinessSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISlider *tensionSlider;
@property (weak, nonatomic) IBOutlet UISlider *frictionSlider;
@property (weak, nonatomic) IBOutlet UISlider *massSlider;

@property (nonatomic) UITableView * tableView;

@property (nonatomic) CGFloat bouncinessValue;
@property (nonatomic) CGFloat speedTweakValue;

@property (nonatomic) CALayer * popCircle;
@property (nonatomic) BOOL animated;

@property (weak, nonatomic) IBOutlet UISwitch *tensionSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *frictionSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *massSwitch;

@property (nonatomic) NSString * animationType;
@property (nonatomic) NSArray * animationTypes;

@property (nonatomic) NSString * exampleID;

- (IBAction)slideChanged:(id)sender;
- (IBAction)showEffects:(id)sender;

@end
