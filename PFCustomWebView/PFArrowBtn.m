//
//  PFArrowBtn.m
//  PFCustomWebView
//
//  Created by Paolo Furlan on 11/11/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import "PFArrowBtn.h"

@implementation PFArrowBtn

-(id)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor=[UIColor clearColor];
        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-image.size.width/4, self.frame.size.height/2-image.size.height/4, image.size.width/2, image.size.height/2)];
        [img setImage:image];
        [self addSubview:img];
    }
    return self;
}

@end