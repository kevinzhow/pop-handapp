//
//  PDMasterViewController.m
//  PopDemos
//
//  Created by kevinzhow on 14-5-14.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "PDMasterViewController.h"

#import "PDUsageViewController.h"

@interface PDMasterViewController ()
@end

@implementation PDMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showPOPUP"]) {
        
        [[segue destinationViewController] setAnimationType:@"POPUP"];
        
    }else if([[segue identifier] isEqualToString:@"showFLYIN"]) {
        
        [[segue destinationViewController] setAnimationType:@"FLYIN"];
        
    }else if([[segue identifier] isEqualToString:@"showTRANSACTION"]) {
        
        [[segue destinationViewController] setAnimationType:@"TRANSACTION"];
    }
    
}



@end
