//
//  PFWebView.m
//  PFCustomWebView
//
//  Created by Paolo Furlan on 11/11/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import "PFWebView.h"

@implementation PFWebView

-(id)initWithFrame:(CGRect)frame andUrl:(NSURL *)urlWebsite
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
        [self loadRequest:[NSURLRequest requestWithURL:urlWebsite]];
        [self setScalesPageToFit:YES];
    }
    return self;
}

@end