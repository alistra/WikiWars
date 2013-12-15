//
//  WWGameViewController.m
//  WikiaWars
//
//  Created by Aleksander Balicki on 12/12/13.
//  Copyright (c) 2013 Wikia. All rights reserved.
//

#import "WWGameViewController.h"
#import "WWStartGameViewController.h"
#import "WWResultViewController.h"

@interface WWGameViewController ()
@end

@implementation WWGameViewController

- (void)loadView {
    self.webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = self.webview;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0 green:0x2D/255.  blue:0x53/255. alpha:1];
    self.navigationController.navigationBar.hidden = YES;

    self.webview.delegate = self;

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:serverUrl]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse*response, NSData*data, NSError*error) {
        if (!data) {
            UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Network error"
                                               message:@"Handling errors in a hackathon project?"
                                              delegate:nil cancelButtonTitle:@"Riiiiight"
                                     otherButtonTitles:nil];
            [view show];
            [self.navigationController popToRootViewControllerAnimated:YES];
            return;
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        self.start = dict[@"article1"];
        self.end = dict[@"article2"];

        [self prepareStartGame];
    }];
}

- (void)prepareStartGame {

    WWStartGameViewController *startGameViewController = [[WWStartGameViewController alloc] initWithStart:self.start end:self.end];
    startGameViewController.gameController = self;
    [self presentViewController:startGameViewController animated:YES completion:nil];

    self.title = [NSString stringWithFormat:@"Reach %@", self.end[@"name"]];

    NSString *string = self.start[@"url"];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}

- (void)startGame {

    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.hidesBackButton = YES;

    self.backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:@selector(popAlertAction:)];

    self.navigationItem.leftBarButtonItem = self.backButton;
    self.backButton.enabled = NO;
    
    self.clicksLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.clicksLabel];

    self.startDate = [NSDate date];
    self.clicks = 0;
}

- (void)popAlertAction:(UIBarButtonItem *)button {

    if (self.webview.canGoBack) {
        
        [self.webview goBack];
        
    } else {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ([request.URL.absoluteString isEqualToString:self.end[@"url"]]) {

        self.clicks++;
        [self won];
        return NO;
    }
    
    BOOL result = navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeOther || navigationType == UIWebViewNavigationTypeBackForward;
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeBackForward) {
        self.clicks++;
    }
    
    return result;
}

-(void)setClicks:(NSUInteger)clicks {
    _clicks = clicks;
    self.clicksLabel.text = [NSString stringWithFormat:@"%d clicks", _clicks];
    [self.clicksLabel sizeToFit];
}

- (void)won {

    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.startDate];

    WWResultViewController *controller = [[WWResultViewController alloc] initWithTime:timeInterval clicks:self.clicks];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.backButton.enabled = self.webview.canGoBack;
    [webView stringByEvaluatingJavaScriptFromString:@"$('#wkTopNav, #wkAdTopLeader, #wkFtr, .messagebox.hidable').remove()"];
}


@end