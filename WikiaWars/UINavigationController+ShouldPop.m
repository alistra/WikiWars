//
// Created by Aleksander Balicki on 15/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//

#import "UINavigationController+ShouldPop.h"


@implementation UINavigationController (ShouldPop)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {

    if ([self.topViewController respondsToSelector:@selector(navigationBar:shouldPopItem:)]) {

        [(id)self.topViewController navigationBar:navigationBar shouldPopItem:item];
    }


    return YES;
}
@end