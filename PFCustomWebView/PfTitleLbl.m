//
//  PfTitleLbl.m
//  PFCustomWebView
//
//  Created by Paolo Furlan on 11/11/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import "PfTitleLbl.h"

@implementation PfTitleLbl

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor clearColor];
        self.textColor=[UIColor whiteColor];
        self.font=[UIFont fontWithName:@"HelveticaNeue" size:18];
        self.textAlignment=NSTextAlignmentCenter;
        self.adjustsFontSizeToFitWidth=YES;
    }
    return self;
}

@end