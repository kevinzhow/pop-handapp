//
//  PDPropertyViewController.h
//  POP-Handapp
//
//  Created by kevinzhow on 14-5-17.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <POP/POP.h>

@interface PDPropertyViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *countingLabel;
@property (nonatomic) UITableView * tableView;
@property (nonatomic) NSString * animationType;
@property (nonatomic) NSArray * animationTypes;
- (IBAction)showEffects:(id)sender;

@end
