//
// Created by Aleksander Balicki on 15/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//

#import "WWResultViewController.h"
#import "UIView+Align.h"

@implementation WWResultViewController {

}
- (instancetype)initWithTime:(NSTimeInterval)interval clicks:(NSUInteger)clicks {
    self = [super init];
    if (self) {
    
        self.timeInterval = interval;
        self.clicks = clicks;
    }
    
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0x2D/255.  blue:0x53/255. alpha:1];

    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.headerLabel.textColor = [UIColor whiteColor];
    self.headerLabel.text = @"You made it!";
    self.headerLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:18];
    self.headerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.headerLabel];

    self.clicksLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.clicksLabel.textColor = [UIColor whiteColor];
    self.clicksLabel.text = [NSString stringWithFormat:@"%d clicks", self.clicks];
    self.clicksLabel.textAlignment = NSTextAlignmentCenter;
    self.clicksLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:22];
    [self.view addSubview:self.clicksLabel];

    self.middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.middleLabel.textColor = [UIColor whiteColor];
    self.middleLabel.text = @"Time";
    self.middleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:18];
    self.middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.middleLabel];

    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.timeLabel.textColor = [UIColor whiteColor];
    self.timeLabel.text = [NSString stringWithFormat:@"%d seconds", (int)self.timeInterval];
    self.timeLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:22];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.timeLabel];

    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 100, 100);
    self.button.backgroundColor = [UIColor colorWithRed:0x0c/255. green:0x4c/255. blue:0x88/255. alpha:1];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button setTitle:@"PLAY AGAIN" forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:22];
    self.button.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    [self.button sizeToFit];
    [self.view addSubview:self.button];

    [self.button addTarget:self action:@selector(playGame) forControlEvents:UIControlEventTouchUpInside];
}

- (void)playGame {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)viewDidLayoutSubviews {
    self.headerLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 1/6.);
    [self.headerLabel align];

    self.clicksLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 2/6.);
    [self.clicksLabel align];
    
    self.middleLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 3/6.);
    [self.middleLabel align];
    
    self.timeLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 4/6.);
    [self.timeLabel align];
    
    self.button.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 5/6.);
    [self.button align];
}

@end