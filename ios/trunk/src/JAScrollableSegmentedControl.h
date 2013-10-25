//
//  PWScrollableSegmentedControl.h
//  JASegmentedControlDemo
//
//  Created by Jad Abi-Abdallah on 04/12/12.
//  Copyright (c) 2012 Inertia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JASegmentedControl;

@interface JAScrollableSegmentedControl : UIScrollView

@property (nonatomic,retain) JASegmentedControl * segmentedControl;

-(void)refreshContentSize;

@end
