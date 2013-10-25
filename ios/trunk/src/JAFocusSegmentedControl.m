//
//  PWFocusSegmentedControl.m
//  JASegmentedControl
//
//  Created by Jad Abi-Abdallah on 30/11/12.
//  Copyright (c) 2012 Inertia. All rights reserved.
//

#import "JAFocusSegmentedControl.h"

@interface JAFocusSegmentedControl()

@property (nonatomic, retain) UIImageView * indicatorImageView;

@end

@implementation JAFocusSegmentedControl

@synthesize indicatorImageView = _indicatorImageView;
- (UIView *)indicatorImageView {
    if (_indicatorImageView == nil) {
        _indicatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
        [self addSubview:_indicatorImageView];
    }
    return _indicatorImageView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.indicatorImageView.hidden = (self.selectedSegmentIndex == NSNotFound);
    
    // Adjust button frame to display indicator properly
    for (int i = 0; i < self.numberOfSegments; i++) {
        UIButton * button = [self buttonAtIndex:i];
        [button setFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y ,button.frame.size.width, button.frame.size.height - self.indicatorImageView.frame.size.height)];
    }
       
    // Indicator
    if (!self.indicatorImageView.hidden) {
        [self.indicatorImageView setCenter:[self centerWithFocusButton]];
        [self bringSubviewToFront:self.indicatorImageView];
    }
}

- (CGPoint)centerWithFocusButton{
    return CGPointMake([self buttonAtIndex:self.selectedSegmentIndex].center.x, self.frame.size.height - self.indicatorImageView.frame.size.height/2);
}

- (void)buttonClicked:(UIButton *)button{
    [super buttonClicked:button];
    [UIView animateWithDuration:0.1f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{self.indicatorImageView.center = [self centerWithFocusButton];}
                     completion:^(BOOL finished) {
                         [self setNeedsLayout];
                     }];
}

- (void)dealloc{
    [_indicatorImageView release];
    [super dealloc];
}

@end
