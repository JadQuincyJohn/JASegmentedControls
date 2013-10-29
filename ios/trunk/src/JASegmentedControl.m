//
//  JASegmentedControl.m
//  JASegmentedControl
//
//  Created by Jad Abi-Abdallah on 28/11/12.
//  Copyright (c) 2012 Inertia. All rights reserved.
//

#import "JASegmentedControl.h"

@interface JASegmentedControl()

@property (nonatomic,assign) CGRect initialFrame;

@end

@implementation JASegmentedControl

@synthesize buttons = _buttons;
@synthesize titles = _titles;
@synthesize pagingEnabled = _pagingEnabled;
@synthesize initialFrame = _initialFrame;
@synthesize backgroundImageView = _backgroundImageView;

- (void)setTitles:(NSArray *)titles forState:(UIControlState)state{
    self.titles = titles;
    for (int i=0;i< self.numberOfSegments;i++) {
        UIButton * button = (UIButton*) [self.buttons objectAtIndex:i];
        NSString * title = [self.titles objectAtIndex:i];
        [button setTitle:title forState:state];
    }
    [self setNeedsLayout];
}

- (void)setFont:(UIFont*)font{
    [self.buttons makeObjectsPerformSelector:@selector(setFont:) withObject:font];
    [self setNeedsLayout];
}

@synthesize numberOfSegments = _numberOfSegments;
- (void) setNumberOfSegments:(NSUInteger)numberOfSegments{
    _numberOfSegments = numberOfSegments;
    self.buttons = [NSMutableArray arrayWithCapacity:_numberOfSegments];
    for (int i = 0; i < self.numberOfSegments; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [button.titleLabel setNumberOfLines:1];
        [self.buttons addObject:button];
    }
    [self setNeedsLayout];
}

- (NSUInteger)numberOfSegments{
    return _numberOfSegments;
}

@synthesize selectedSegmentIndex = _selectedSegmentIndex;
- (void)setSelectedSegmentIndex:(NSUInteger)selectedSegmentIndex {
	if (_selectedSegmentIndex != selectedSegmentIndex) {
		_selectedSegmentIndex = selectedSegmentIndex;
        if (selectedSegmentIndex != NSNotFound) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
            for (int i = 0; i < self.numberOfSegments; i++) {
                UIButton * b = [self buttonAtIndex:i];
                [b setSelected:(i == _selectedSegmentIndex)];
            }
        }
	}
}

#pragma mark Lifecycle
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setNeedsLayout];
        self.initialFrame = frame;
    }
    return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
    self.selectedSegmentIndex = NSNotFound;
}

#pragma mark Layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.backgroundImageView) {
        [self.backgroundImageView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.backgroundImageView];
    }
    
    for (int i = 0; i < self.numberOfSegments; i++) {
        UIButton * button = [self buttonAtIndex:i];
        CGSize s = [self contentOffsetForSegmentAtIndex:i];
        CGFloat width = [self widthForSegment];
        [button setFrame:CGRectMake(s.width,s.height,width,self.frame.size.height)];
        [self addSubview:button];
    }
    [self adjustFrameToContentSize];
}

#pragma mark - Managing events
- (void)buttonClicked:(UIButton *)button{
    self.selectedSegmentIndex = [self.buttons indexOfObject:button];
}

#pragma mark - Managing Segment Behavior and Appearance
- (CGSize)contentOffsetForSegmentAtIndex:(NSUInteger)segment{
    CGSize contentOffsetForSegmentAtIndex = CGSizeZero;
    if (self.pagingEnabled) {
        for (int i = 0; i < segment; i++) {
            contentOffsetForSegmentAtIndex.width += [self widthForSegment];
        }
    }else{
        CGFloat itemWidth = floorf(self.frame.size.width / self.numberOfSegments);
        contentOffsetForSegmentAtIndex = CGSizeMake(segment * itemWidth,0);
    }
    return contentOffsetForSegmentAtIndex;
}

#pragma mark Width for segment
- (CGFloat)widthForSegment{
    CGFloat widthForSegmentAtIndex = 0;
    if (self.pagingEnabled) {
        widthForSegmentAtIndex = floorf(self.initialFrame.size.width / kNumberOfITems);
    }else{
        widthForSegmentAtIndex = floorf(self.frame.size.width / self.numberOfSegments);
    }
    return widthForSegmentAtIndex;
}

#pragma mark Frame adjustment
- (CGSize)contentSize{
    CGSize contentSize = CGSizeZero;
    if (self.pagingEnabled) {
        for (int i = 0; i < self.numberOfSegments; i++) {
            contentSize.width += [self widthForSegment];
        }
        contentSize.height = self.frame.size.height;
    }else{
        
    }
    return contentSize;
}

- (void)adjustFrameToContentSize{
    if (self.pagingEnabled) {
        CGSize contentSize = [self contentSize];
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, contentSize.width, contentSize.height)];
    }
}

#pragma mark - Buttons Access
- (UIButton *)buttonAtIndex:(NSUInteger)index{
    return [self.buttons objectAtIndex:index];
}

#pragma mark - Managing Segment Content
-(UIImage*)imageForSegmentAtIndex:(NSUInteger)index{
    return [self buttonAtIndex:index].imageView.image;
}

-(NSString*)titleForSegmentAtIndex:(NSUInteger)index andForState:(UIControlState)state{
    return [[self buttonAtIndex:index] titleForState:state];
}

#pragma mark - Customizing Appearance

- (UIImage *)backgroundImageForState:(UIControlState)state andIndex:(NSUInteger)index{
    return [[self buttonAtIndex:index] backgroundImageForState:state];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state andIndex:(NSUInteger)index{
    [[self buttonAtIndex:index] setBackgroundImage:backgroundImage forState:state];
}

-(void) setTitleColor:(UIColor*)textColor forState:(UIControlState)state{
    for (int i = 0;i< self.numberOfSegments;i++) {
        [[self buttonAtIndex:i] setTitleColor:textColor forState:state];
    }
}

- (UIImage *)imageWithColor:(UIColor *)color forWidth:(CGFloat)width {
    CGRect rect = CGRectMake(0.0f, 0.0f, width, self.bounds.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    for (int i = 0;i < self.numberOfSegments;i++) {
        UIImage * image = [self imageWithColor:color forWidth:self.bounds.size.width / self.numberOfSegments];
        [self setBackgroundImage:image forState:state andIndex:i];
    }
}

-(void) setTitleShadowColor:(UIColor*)shadowColor forState:(UIControlState)state{
    for (int i = 0; i < self.numberOfSegments;i++) {
        UIButton * b = [self buttonAtIndex:i];
        [b.titleLabel setShadowOffset:CGSizeMake(0, 1)];
        [b setTitleShadowColor:shadowColor forState:state];
    }
}

- (void)setStretchableBackgroundImage:(UIImage *)image forState:(UIControlState)state{
    for (int i = 0; i < self.numberOfSegments;i++) {
        UIButton * b = [self buttonAtIndex:i];
        UIImage *stretchedBackgroundImage = [image stretchableImageWithLeftCapWidth:image.size.width/2-1 topCapHeight:image.size.height/2];
        [b setBackgroundImage:stretchedBackgroundImage forState:state];
    }
}

#pragma mark Title Access
- (NSString *)titleForButtonAtIndex:(NSUInteger)index {
    return [[[self buttonAtIndex:index] titleLabel] text];
}

@end
