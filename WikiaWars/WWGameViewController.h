//
//  WWGameViewController.h
//  WikiaWars
//
//  Created by Aleksander Balicki on 12/12/13.
//  Copyright (c) 2013 Wikia. All rights reserved.
//

#import <UIKit/UIKit.h>

//static NSString *const serverUrl = @"http://10.10.10.111:8080";
static NSString *const serverUrl = @"http://127.0.0.1:8080";

@interface WWGameViewController : UIViewController <UIWebViewDelegate>

@property(nonatomic, strong) NSDictionary *start, *end;
@property(nonatomic, strong) UIWebView *webview;

@property(nonatomic, strong) NSDate *startDate;
@property(nonatomic, strong) UIBarButtonItem *backButton;
@property(nonatomic) NSUInteger clicks;
@property(nonatomic, strong) UILabel *clicksLabel;
- (void)startGame;
@end