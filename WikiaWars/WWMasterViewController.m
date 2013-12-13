//
//  WWMasterViewController.m
//  WikiaWars
//
//  Created by Aleksander Balicki on 12/12/13.
//  Copyright (c) 2013 Wikia. All rights reserved.
//

#import "WWMasterViewController.h"

#import "WWDetailViewController.h"

@interface WWMasterViewController ()
@end

@implementation WWMasterViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.frame = CGRectMake(100, 100, 100, 100);
    self.startButton.backgroundColor = [UIColor magentaColor];
    self.startButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.startButton];
}

- (void)startGame:(id)startGame {
    [self.navigationController pushViewController:[[WWDetailViewController alloc] init] animated:YES];
}

@end