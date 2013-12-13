//
// Created by Aleksander Balicki on 13/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//
//


#import "WWStartGameViewController.h"
#import "WWDetailViewController.h"


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
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {

    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.toLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];

    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(100, 100, 100, 100);
    [self.button setTitle:@"Play" forState:UIControlStateNormal];
    [self.view addSubview:self.button];

    [self.button addTarget:self action:@selector(playGame) forControlEvents:UIControlEventTouchUpInside];
}

- (void)playGame {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        [(WWDetailViewController *) self.presentingViewController startGame];
    }];
}

@end