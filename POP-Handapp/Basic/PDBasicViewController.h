//
//  PDBasicViewController.h
//  POP-Handapp
//
//  Created by kevinzhow on 14-5-17.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <POP/POP.h>

@interface PDBasicViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) CALayer * popCircle;
@property (nonatomic) UITableView * tableView;
@property (nonatomic) BOOL animated;
@property (nonatomic) NSString * animationType;
@property (nonatomic) NSArray * animationTypes;
- (IBAction)showEffects:(id)sender;

@end
