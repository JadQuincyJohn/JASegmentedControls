//
//  JASegmentedControlViewController.h
//  JASegmentedControlDemo
//
//  Created by Jad on 30/11/12.
//  Copyright (c) 2013 Inertia. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  kOrange [UIColor orangeColor]
#define  kGray   [UIColor lightGrayColor]
#define  kBlack  [UIColor blackColor]
#define  kYellow [UIColor yellowColor]
#define  kWhite  [UIColor whiteColor]
#define  kRed    [UIColor redColor]


@class JASegmentedControl;

@interface JASegmentedControlViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *valueLabel;

#pragma mark Value Changed method
- (void)valueChanged:(JASegmentedControl *)sender;

@end
