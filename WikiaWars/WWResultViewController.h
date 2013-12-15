//
// Created by Aleksander Balicki on 15/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WWResultViewController : UIViewController

@property(nonatomic) NSTimeInterval timeInterval;

@property(nonatomic) NSUInteger clicks;

- (id)initWithTime:(NSTimeInterval)interval clicks:(NSUInteger)clicks;
@end