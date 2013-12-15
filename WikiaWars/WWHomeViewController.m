//
//  WWHomeViewController.m
//  WikiaWars
//
//  Created by Aleksander Balicki on 12/12/13.
//  Copyright (c) 2013 Wikia. All rights reserved.
//

#import "WWHomeViewController.h"

#import "WWGameViewController.h"
#import "UIView+Align.h"

@interface WWHomeViewController ()
@end

@implementation WWHomeViewController

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = YES;

    self.view.backgroundColor = [UIColor colorWithRed:0 green:0x2D/255.  blue:0x53/255. alpha:1];

    self.logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wikia-wars@2.png"]];
    self.logoView.frame = CGRectMake(0, 0, 280, 300);
    self.logoView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.logoView];

    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.frame = CGRectMake(0, 0, 100, 100);
    self.startButton.backgroundColor = [UIColor colorWithRed:0x0c/255. green:0x4c/255. blue:0x88/255. alpha:1];
    self.startButton.layer.cornerRadius = 1;
    self.startButton.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:20];
    [self.startButton setTitle:@"PLAY NOW!" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.startButton.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    [self.startButton sizeToFit];
    [self.view addSubview:self.startButton];

    [self.startButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLayoutSubviews {
    self.logoView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds) * 1/3.);
    [self.logoView align];
    self.startButton.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds) * 2/3.);
    [self.startButton align];
}

- (void)startGame:(id)startGame {
    [self.navigationController pushViewController:[[WWGameViewController alloc] init] animated:YES];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end