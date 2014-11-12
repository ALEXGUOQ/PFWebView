//
//  PFReloadBtn.m
//  PFCustomWebView
//
//  Created by Paolo Furlan on 11/11/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import "PFReloadBtn.h"

@interface PFReloadBtn ()
{
    UIActivityIndicatorView *loadingView;
    UIImageView *imgUpdate;
}

@end

@implementation PFReloadBtn

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor clearColor];
        
        imgUpdate=[[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-12, self.frame.size.height/2-12, 24, 24)];
        [imgUpdate setImage:[UIImage imageNamed:@"refresh"]];
        [self addSubview:imgUpdate];

        loadingView=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-12, self.frame.size.height/2-12, 24, 24)];
        loadingView.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhite;
        [self addSubview:loadingView];
    }
    return self;
}

-(void)startUpdate
{
    imgUpdate.hidden=YES;
    loadingView.hidden=NO;
    [loadingView startAnimating];
}

-(void)endUpdate
{
    imgUpdate.hidden=NO;
    loadingView.hidden=YES;
    [loadingView stopAnimating];
}

@end