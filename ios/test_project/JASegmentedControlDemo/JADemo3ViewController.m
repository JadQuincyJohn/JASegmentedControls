//
//  JAScrollableSegmentedControlViewController.m
//  JASegmentedControlDemo
//
//  Created by Jad on 15/07/13.
//  Copyright (c) 2013 Inertia. All rights reserved.
//
#import "JADemo3ViewController.h"
#import "JAScrollableSegmentedControl.h"
#import "JASegmentedControl.h"


@interface JADemo3ViewController ()

@property (retain, nonatomic) IBOutlet JAScrollableSegmentedControl *scrollableSegmentedControl;

@end

@implementation JADemo3ViewController

@synthesize scrollableSegmentedControl = _scrollableSegmentedControl;

- (void)setUpSegmentedControl:(JASegmentedControl*)control {
    // Set the number of segments
    control.numberOfSegments = 10;
    
    // Set the titles for normal state
    [control setTitles:[NSArray arrayWithObjects:@"p",@"m",@"s",@"l",@"b",@"p",@"m",@"s",@"l",@"b",nil] forState:UIControlStateNormal];
    // Set the titles for selected state
    [control setTitles:[NSArray arrayWithObjects:@"P",@"M",@"S",@"L",@"B",@"P",@"M",@"S",@"L",@"B",nil] forState:UIControlStateSelected];
    
    // Fonts
    UIFont * font1 = [UIFont fontWithName:@"Verdana-Bold" size:18];
    [control setFont:font1];
      
    // Set the title appearance - Normal
    [control setTitleColor:kBlack forState:UIControlStateNormal];
    [control setTitleShadowColor:kGray forState:UIControlStateNormal];
    // Set the title appearance - Selected
    [control setTitleColor:kOrange forState:UIControlStateSelected];
    [control setTitleShadowColor:kYellow forState:UIControlStateSelected];
    
    
    // Set the title appearance - Highlighted
    [control setTitleColor:kWhite forState:UIControlStateHighlighted];
    [control setTitleShadowColor:kGray forState:UIControlStateHighlighted];
    
    // Background Images
    
    [control setBackgroundImage:[UIImage imageNamed:@"01_nb"] forState:UIControlStateNormal andIndex:0];
    [control setBackgroundImage:[UIImage imageNamed:@"02_nb"] forState:UIControlStateNormal andIndex:1];
    [control setBackgroundImage:[UIImage imageNamed:@"03_nb"] forState:UIControlStateNormal andIndex:2];
    [control setBackgroundImage:[UIImage imageNamed:@"04_nb"] forState:UIControlStateNormal andIndex:3];
    [control setBackgroundImage:[UIImage imageNamed:@"05_nb"] forState:UIControlStateNormal andIndex:4];
    
    [control setBackgroundImage:[UIImage imageNamed:@"01_nb"] forState:UIControlStateNormal andIndex:5];
    [control setBackgroundImage:[UIImage imageNamed:@"02_nb"] forState:UIControlStateNormal andIndex:6];
    [control setBackgroundImage:[UIImage imageNamed:@"03_nb"] forState:UIControlStateNormal andIndex:7];
    [control setBackgroundImage:[UIImage imageNamed:@"04_nb"] forState:UIControlStateNormal andIndex:8];
    [control setBackgroundImage:[UIImage imageNamed:@"05_nb"] forState:UIControlStateNormal andIndex:9];
    
    UIControlState state = UIControlStateHighlighted;
    
    [control setBackgroundImage:[UIImage imageNamed:@"01_nb"] forState:state andIndex:0];
    [control setBackgroundImage:[UIImage imageNamed:@"02_nb"] forState:state andIndex:1];
    [control setBackgroundImage:[UIImage imageNamed:@"03_nb"] forState:state andIndex:2];
    [control setBackgroundImage:[UIImage imageNamed:@"04_nb"] forState:state andIndex:3];
    [control setBackgroundImage:[UIImage imageNamed:@"05_nb"] forState:state andIndex:4];
    
    [control setBackgroundImage:[UIImage imageNamed:@"01_nb"] forState:state andIndex:5];
    [control setBackgroundImage:[UIImage imageNamed:@"02_nb"] forState:state andIndex:6];
    [control setBackgroundImage:[UIImage imageNamed:@"03_nb"] forState:state andIndex:7];
    [control setBackgroundImage:[UIImage imageNamed:@"04_nb"] forState:state andIndex:8];
    [control setBackgroundImage:[UIImage imageNamed:@"05_nb"] forState:state andIndex:9];
    
    state = UIControlStateSelected;
    
    [control setBackgroundImage:[UIImage imageNamed:@"01"] forState:state andIndex:0];
    [control setBackgroundImage:[UIImage imageNamed:@"02"] forState:state andIndex:1];
    [control setBackgroundImage:[UIImage imageNamed:@"03"] forState:state andIndex:2];
    [control setBackgroundImage:[UIImage imageNamed:@"04"] forState:state andIndex:3];
    [control setBackgroundImage:[UIImage imageNamed:@"05"] forState:state andIndex:4];
    
    [control setBackgroundImage:[UIImage imageNamed:@"01"] forState:state andIndex:5];
    [control setBackgroundImage:[UIImage imageNamed:@"02"] forState:state andIndex:6];
    [control setBackgroundImage:[UIImage imageNamed:@"03"] forState:state andIndex:7];
    [control setBackgroundImage:[UIImage imageNamed:@"04"] forState:state andIndex:8];
    [control setBackgroundImage:[UIImage imageNamed:@"05"] forState:state andIndex:9];
    
    [control addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSegmentedControl:self.scrollableSegmentedControl.segmentedControl];
    [self.scrollableSegmentedControl refreshContentSize];
}

@end

