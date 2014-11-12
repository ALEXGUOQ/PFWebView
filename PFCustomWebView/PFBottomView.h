//
//  PFBottomView.h
//  PFCustomWebView
//
//  Created by Paolo Furlan on 11/11/14.
//  Copyright (c) 2014 Paolo Furlan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PFArrowBtn.h"

#import "PFReloadBtn.h"

@interface PFBottomView : UIView

@property (nonatomic, strong) PFArrowBtn *backBtn;
@property (nonatomic, strong) PFArrowBtn *forwardBtn;

@property (nonatomic, strong) PFReloadBtn *reloadBtn;

@property (nonatomic, strong) PFArrowBtn *shareBtn;

@end