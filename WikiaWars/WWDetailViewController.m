//
//  WWDetailViewController.m
//  WikiaWars
//
//  Created by Aleksander Balicki on 12/12/13.
//  Copyright (c) 2013 Wikia. All rights reserved.
//

#import "WWDetailViewController.h"
#import "WWStartGameViewController.h"

@interface WWDetailViewController ()
@end

@implementation WWDetailViewController

- (void)loadView {
    self.webview = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = self.webview;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view.backgroundColor = [UIColor magentaColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.webview.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.10.10.111:8080"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse*response, NSData*data, NSError*error) {
        if (!data) {
            //TODO: handle error
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
    
    NSString *string = self.start[@"url"];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:request];
}

- (void)startGame {

    self.startDate = [NSDate date];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ([request.URL.absoluteString isEqualToString:self.end[@"url"]]) {

        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"You won" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [view show];
        return NO;
    }
    
    return navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeOther;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@"$('#wkTopNav, #wkAdTopLeader, #wkFtr, .messagebox.hidable').remove()"];
}

@end