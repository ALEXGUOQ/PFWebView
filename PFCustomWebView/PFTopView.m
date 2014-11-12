//
//  PFTopView.m
//  PFCustomWebView
//
//  Created by Paolo Furlan on 11/11/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import "PFTopView.h"

@implementation PFTopView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1.0];
        
        _titleLbl=[[PfTitleLbl alloc] initWithFrame:CGRectMake(0, 18, self.frame.size.width, 24)];
        [self addSubview:_titleLbl];
    }
    return self;
}

@end