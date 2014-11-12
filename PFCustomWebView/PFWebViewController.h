//
//  WebsiteViewController.h
//  Useless web
//
//  Created by Paolo Furlan on 20/06/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PFWebView.h"
#import "PFTopView.h"
#import "PFBottomView.h"

@interface PFWebViewController : UIViewController

@property (nonatomic, strong) PFWebView *webView;

@property (nonatomic, strong) PFTopView *topView;
@property (nonatomic, strong) PFBottomView *bottomView;

@end