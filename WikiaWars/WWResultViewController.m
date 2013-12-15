//
// Created by Aleksander Balicki on 15/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//

#import "WWResultViewController.h"


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

}

@end