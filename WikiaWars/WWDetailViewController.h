//
//  WWDetailViewController.h
//  WikiaWars
//
//  Created by Aleksander Balicki on 12/12/13.
//  Copyright (c) 2013 Wikia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWDetailViewController : UIViewController <UIWebViewDelegate>

@property(nonatomic, strong) NSDictionary *start, *end;
@property(nonatomic, strong) UIWebView *webview;

@property(nonatomic, strong) NSDate *startDate;

- (void)startGame;
@end