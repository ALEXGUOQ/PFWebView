//
//  PFBottomView.m
//  PFCustomWebView
//
//  Created by Paolo Furlan on 11/11/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import "PFBottomView.h"

@implementation PFBottomView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0];

        _backBtn=[[PFArrowBtn alloc] initWithFrame:CGRectMake(0, 0, 40, 44) andImage:[UIImage imageNamed:@"back"]];
        [self addSubview:_backBtn];

        _forwardBtn=[[PFArrowBtn alloc] initWithFrame:CGRectMake(50, 0, 40, 44) andImage:[UIImage imageNamed:@"forward"]];
        [self addSubview:_forwardBtn];

        _reloadBtn=[[PFReloadBtn alloc] initWithFrame:CGRectMake(100, 0, 40, 44)];
        [self addSubview:_reloadBtn];
        
        _shareBtn=[[PFArrowBtn alloc] initWithFrame:CGRectMake(self.frame.size.width-40, 0, 40, 44) andImage:[UIImage imageNamed:@"share"]];
        [self addSubview:_shareBtn];
    }
    return self;
}

@end