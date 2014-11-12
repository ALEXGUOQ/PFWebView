//
//  WebsiteViewController.m
//  Useless web
//
//  Created by Paolo Furlan on 20/06/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import "PFWebViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

#define kColorBar [UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0]
#define kWidth  [[UIScreen mainScreen] applicationFrame].size.width
#define kHeight  [[UIScreen mainScreen] applicationFrame].size.height

@interface PFWebViewController () <UIWebViewDelegate, UIActionSheetDelegate> {
    NSString *strUrlWebsite;
}

@end

@implementation PFWebViewController


-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initVariables];
    [self loadGraphics];
}

-(void)initVariables
{
    //insert here the website that you want to download
    strUrlWebsite=[NSString stringWithFormat:@"http://www.twitter.com/goreste"];
}


-(void)loadGraphics {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor=[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];

    
    _topView=[[PFTopView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44)];
    _topView.titleLbl.text=[[strUrlWebsite stringByReplacingOccurrencesOfString:@"http://" withString:@""] stringByReplacingOccurrencesOfString:@"/" withString:@""];
    [self.view addSubview:_topView];
    
    _webView=[[PFWebView alloc] initWithFrame:CGRectMake(0, 44, kWidth, kHeight-88) andUrl:[NSURL URLWithString:strUrlWebsite]];
    _webView.delegate=self;
    [self.view addSubview:_webView];

    _bottomView=[[PFBottomView alloc] initWithFrame:CGRectMake(0, kHeight-24, kWidth, 44)];
    [self.view addSubview:_bottomView];

    
    [_bottomView.shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];

    [_bottomView.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView.forwardBtn addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView.reloadBtn addTarget:self action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView.reloadBtn startUpdate];

}

-(void)back {
    if(_webView.canGoBack){
        _topView.titleLbl.text=[[strUrlWebsite stringByReplacingOccurrencesOfString:@"http://" withString:@""] stringByReplacingOccurrencesOfString:@"/" withString:@""];
        [_webView goBack];
    }
}

-(void)forward {
    if(_webView.canGoForward){
        _topView.titleLbl.text=[[strUrlWebsite stringByReplacingOccurrencesOfString:@"http://" withString:@""] stringByReplacingOccurrencesOfString:@"/" withString:@""];
        [_webView goForward];
    }
}

-(void)reload {
    [_bottomView.reloadBtn startUpdate];
    [_webView reload];
}


- (void)webViewDidStartLoad:(UIWebView *)webContent{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webContentLocal {
    [_bottomView.reloadBtn endUpdate];
    
    if(_webView.canGoBack){
        _bottomView.backBtn.alpha=1.0;
    }else{
        _bottomView.backBtn.alpha=0.5;
    }
    
    if(_webView.canGoForward){
        _bottomView.forwardBtn.alpha=1.0;
    }else{
        _bottomView.forwardBtn.alpha=0.5;
    }
}


-(void)share {
    UIActionSheet *popupQuery = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Twitter", nil];
    popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [popupQuery showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self facebook];
    } else if (buttonIndex == 1) {
        [self twitter];
    }
}

-(void)facebook {
    SLComposeViewController *mySLComposerSheet;
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"%@ \n\n Browse sites with #UselessWebApp", strUrlWebsite]];
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://goo.gl/bBNU9p"]];
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    break;
                case SLComposeViewControllerResultDone:{
                    break;
                }
                default:
                    break;
            }
        }];
    }else{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Permission denied", nil) message:NSLocalizedString(@"You have to allow UselessWeb to access your Facebook account! Go to Settings > Facebook", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
        [alert show];
    }
}

-(void)twitter {
    SLComposeViewController *mySLComposerSheet;
    NSString *combineMessage = [NSString stringWithFormat:@"%@ \n\n Browse sites with #UselessWebApp %@", strUrlWebsite, @"http://goo.gl/bBNU9p"];
    NSString *escapedMessage = [combineMessage stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSString *appURL = [NSString stringWithFormat:@"twitter://post?message=%@", escapedMessage];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"%@ \n\n Browse sites with #UselessWebApp", strUrlWebsite]];
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://goo.gl/bBNU9p"]];
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
        
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    break;
                case SLComposeViewControllerResultDone:{
                    break;
                }
                default:
                    break;
            }
        }];
    }else{
        if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appURL]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
        } else {
            NSString *web = [NSString stringWithFormat:@"https://twitter.com/intent/tweet?text=%@", escapedMessage];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:web]];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
