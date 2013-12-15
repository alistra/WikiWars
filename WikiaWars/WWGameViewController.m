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
            [[UIAlertView alloc] initWithTitle:@"Network error"
                                       message:@"Handling errors in a hackathon project?"
                                      delegate:nil cancelButtonTitle:@"Riiiiight"
                             otherButtonTitles:nil];
            [self.navigationController popViewControllerAnimated:YES];
            [self.navigationController popViewControllerAnimated:YES];
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

    [self presentViewController:startGameViewController animated:YES completion:nil];

    self.title = [NSString stringWithFormat:@"Reach %@", self.end[@"name"]];

    NSString *string = self.start[@"url"];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}

- (void)startGame {

    self.navigationController.navigationBar.hidden = NO;
    self.startDate = [NSDate date];
    self.clicks = 0;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ([request.URL.absoluteString isEqualToString:self.end[@"url"]]) {

        [self won];
        return NO;
    }
    
    return navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeOther;
}

- (void)won {

    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.startDate];

    WWResultViewController *controller = [[WWResultViewController alloc] initWithTime:timeInterval clicks:self.clicks];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@"$('#wkTopNav, #wkAdTopLeader, #wkFtr, .messagebox.hidable').remove()"];
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {

    if (self.webview.canGoBack) {

        [self.webview goBack];
        return NO;
    }

    return YES;
}

@end