//
//  ViewController.m
//  JASegmentedControl
//
//  Created by Jad Abi-Abdallah on 28/11/12.
//  Copyright (c) 2012 Inertia. All rights reserved.
//

#import "JADemo1ViewController.h"
#import "JASegmentedControl.h"
#import "JAFocusSegmentedControl.h"


@interface JADemo1ViewController ()

@property (retain, nonatomic) IBOutlet JASegmentedControl *segmentedControl;

@end

@implementation JADemo1ViewController

@synthesize segmentedControl = _segmentedControl;

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUpSegmentedControl:self.segmentedControl]; 
}

- (void)setUpSegmentedControl:(JASegmentedControl*)control {
    control.numberOfSegments = 5;
    [control setTitles:[NSArray arrayWithObjects:@"p",@"m",@"s",@"l",@"b", nil] forState:UIControlStateNormal];
    [control setTitles:[NSArray arrayWithObjects:@"P",@"M",@"S",@"L",@"B", nil] forState:UIControlStateSelected];
    
    // Fonts
    [control setFont:[UIFont fontWithName:@"Verdana-Bold" size:18]];
    
    // Set the title appearance - Normal
    [control setTitleColor:kWhite forState:UIControlStateNormal];
    [control setTitleShadowColor:kGray forState:UIControlStateNormal];
    // Set the title appearance - Selected
    [control setTitleColor:kRed forState:UIControlStateSelected];
    [control setTitleShadowColor:kOrange forState:UIControlStateSelected];

    
    // Set the title appearance - Highlighted
    [control setTitleColor:kWhite forState:UIControlStateHighlighted];
    [control setTitleShadowColor:kGray forState:UIControlStateHighlighted];
    
    // Background Images
    
    [control setBackgroundImage:[UIImage imageNamed:@"01_nb"] forState:UIControlStateNormal andIndex:0];
    [control setBackgroundImage:[UIImage imageNamed:@"02_nb"] forState:UIControlStateNormal andIndex:1];
    [control setBackgroundImage:[UIImage imageNamed:@"03_nb"] forState:UIControlStateNormal andIndex:2];
    [control setBackgroundImage:[UIImage imageNamed:@"04_nb"] forState:UIControlStateNormal andIndex:3];
    [control setBackgroundImage:[UIImage imageNamed:@"05_nb"] forState:UIControlStateNormal andIndex:4];
        
    [control setBackgroundImage:[UIImage imageNamed:@"01_nb"] forState:UIControlStateHighlighted andIndex:0];
    [control setBackgroundImage:[UIImage imageNamed:@"02_nb"] forState:UIControlStateHighlighted andIndex:1];
    [control setBackgroundImage:[UIImage imageNamed:@"03_nb"] forState:UIControlStateHighlighted andIndex:2];
    [control setBackgroundImage:[UIImage imageNamed:@"04_nb"] forState:UIControlStateHighlighted andIndex:3];
    [control setBackgroundImage:[UIImage imageNamed:@"05_nb"] forState:UIControlStateHighlighted andIndex:4];
    
    [control setBackgroundImage:[UIImage imageNamed:@"01"] forState:UIControlStateSelected andIndex:0];
    [control setBackgroundImage:[UIImage imageNamed:@"02"] forState:UIControlStateSelected andIndex:1];
    [control setBackgroundImage:[UIImage imageNamed:@"03"] forState:UIControlStateSelected andIndex:2];
    [control setBackgroundImage:[UIImage imageNamed:@"04"] forState:UIControlStateSelected andIndex:3];
    [control setBackgroundImage:[UIImage imageNamed:@"05"] forState:UIControlStateSelected andIndex:4];
    
    [control addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSegmentedControl:self.segmentedControl];    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
