//
// Created by Aleksander Balicki on 13/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//
//


#import "WWStartGameViewController.h"
#import "WWGameViewController.h"


@implementation WWStartGameViewController {

}

- (instancetype)initWithStart:(NSDictionary *)start end:(NSDictionary *)end {
    self = [super init];
    if (self) {
        self.start = start;
        self.end = end;
    }
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:0x2D/255.  blue:0x53/255. alpha:1];

    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.headerLabel.textColor = [UIColor whiteColor];
    self.headerLabel.text = @"Find a way from";
    self.headerLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:18];
    self.headerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.headerLabel];

    self.fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.fromLabel.textColor = [UIColor whiteColor];
    self.fromLabel.text = self.start[@"name"];
    self.fromLabel.textAlignment = NSTextAlignmentCenter;
    self.fromLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:22];
    [self.view addSubview:self.fromLabel];

    self.middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.middleLabel.textColor = [UIColor whiteColor];
    self.middleLabel.text = @"to";
    self.middleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:18];
    self.middleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.middleLabel];

    self.toLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.toLabel.textColor = [UIColor whiteColor];
    self.toLabel.text = self.end[@"name"];
    self.toLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:22];
    self.toLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.toLabel];

    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 0, 100, 100);
    self.button.backgroundColor = [UIColor colorWithRed:0x0c/255. green:0x4c/255. blue:0x88/255. alpha:1];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button setTitle:@"START!" forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:22];
    self.button.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    [self.button sizeToFit];
    [self.view addSubview:self.button];

    [self.button addTarget:self action:@selector(playGame) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewDidLayoutSubviews {
    self.headerLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 1/6.);
    self.fromLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 2/6.);
    self.middleLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 3/6.);
    self.toLabel.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 4/6.);
    self.button.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds)* 5/6.);
}

- (void)playGame {
    [self.gameController startGame];

    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end