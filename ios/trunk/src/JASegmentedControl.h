//
//  JASegmentedControl.h
//  JASegmentedControl
//
//  Created by Jad Abi-Abdallah on 28/11/12.
//  Copyright (c) 2012 Inertia. All rights reserved.
//


#import <UIKit/UIKit.h>
#define kNumberOfITems 3

@interface JASegmentedControl : UIControl

@property(nonatomic,  assign) NSUInteger selectedSegmentIndex;
@property (nonatomic, assign) NSUInteger numberOfSegments;
@property (nonatomic, retain) NSMutableArray* buttons;
@property (nonatomic, assign) BOOL pagingEnabled;
@property (nonatomic, retain) NSArray * titles;
@property (nonatomic, retain) UIImageView * backgroundImageView;

#pragma mark - Customizing Appearance
- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state andIndex:(NSUInteger)index;
- (void)setFont:(UIFont*)font;
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
- (void)setTitleColor:(UIColor*)textColor forState:(UIControlState)state;
- (void)setTitleShadowColor:(UIColor*)shadowColor forState:(UIControlState)state;
- (void)setTitles:(NSArray *)titles forState:(UIControlState)state;
- (void)setStretchableBackgroundImage:(UIImage *)image forState:(UIControlState)state;

#pragma mark Title Access
- (NSString *)titleForButtonAtIndex:(NSUInteger)index;

#pragma mark Button Access
- (UIButton*)buttonAtIndex:(NSUInteger)index;
#pragma mark - Managing events
- (void)buttonClicked:(UIButton *)button;

- (CGSize)contentSize;

@end
