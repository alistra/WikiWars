//
// Created by Aleksander Balicki on 13/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//
//


#import <Foundation/Foundation.h>


@interface WWStartGameViewController : UIViewController
@property(nonatomic, strong) NSDictionary *start;

@property(nonatomic, strong) NSDictionary *end;

@property(nonatomic, strong) UIButton *button;

@property(nonatomic, strong) UILabel *headerLabel;

@property(nonatomic, strong) UILabel *fromLabel;

@property(nonatomic, strong) UILabel *middleLabel;

@property(nonatomic, strong) UILabel *toLabel;

- (id)initWithStart:(NSDictionary *)dictionary end:(NSDictionary *)end;
@end