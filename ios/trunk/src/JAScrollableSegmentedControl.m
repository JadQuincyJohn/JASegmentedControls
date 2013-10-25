//
//  PWScrollableSegmentedControl.m
//  JASegmentedControlDemo
//
//  Created by Jad Abi-Abdallah on 04/12/12.
//  Copyright (c) 2012 Inertia. All rights reserved.
//

#import "JAScrollableSegmentedControl.h"
#import "JASegmentedControl.h"

@implementation JAScrollableSegmentedControl

@synthesize segmentedControl = _segmentedControl;

#pragma mark Lifecycle
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

#pragma mark Content Size computation
- (void)refreshContentSize{
    [self setContentSize:[self.segmentedControl contentSize]];
}

#pragma mark Setup
- (void)setup{
    _segmentedControl = [[JASegmentedControl alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [_segmentedControl setPagingEnabled:YES];
    [self addSubview:_segmentedControl];
    [self setCanCancelContentTouches:YES];
    [self setPagingEnabled:YES];
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view{
    return ([view isKindOfClass:[UIButton class]]) ? YES : NO ;
}

- (void)dealloc{
    [_segmentedControl release];
    [super dealloc];
}


@end
