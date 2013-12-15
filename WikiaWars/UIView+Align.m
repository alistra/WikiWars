//
// Created by Aleksander Balicki on 14/12/13.
// Copyright (c) 2013 Wikia. All rights reserved.
//

#import "UIView+Align.h"


@implementation UIView (Align)

- (void)align  {
    self.frame = CGRectMake(floorf(self.frame.origin.x), floorf(self.frame.origin.y), self.frame.size.width, self.frame.size.height);
}
@end