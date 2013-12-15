//
// Created by Aleksander Balicki on 15/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WWResultViewController : UIViewController

@property(nonatomic) NSTimeInterval timeInterval;

@property(nonatomic) NSUInteger clicks;

@property(nonatomic, strong) UILabel *headerLabel;

@property(nonatomic, strong) UILabel *clicksLabel;

@property(nonatomic, strong) UILabel *middleLabel;

@property(nonatomic, strong) UILabel *timeLabel;

@property(nonatomic, strong) UIButton *button;

- (id)initWithTime:(NSTimeInterval)interval clicks:(NSUInteger)clicks;
@end