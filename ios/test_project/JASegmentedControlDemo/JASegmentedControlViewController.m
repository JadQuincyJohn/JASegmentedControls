//
//  JASegmentedControlViewController.m
//  JASegmentedControlDemo
//
//  Created by Jad on 30/11/12.
//  Copyright (c) 2013 Inertia. All rights reserved.
//

#import "JASegmentedControlViewController.h"
#import "JASegmentedControl.h"

@implementation JASegmentedControlViewController

@synthesize valueLabel = _valueLabel;

- (void)valueChanged:(JASegmentedControl *)control{
    NSLog(@"Value changed  to index %i in class %@",control.selectedSegmentIndex, NSStringFromClass([self class]));
    [self.valueLabel setText:[control titleForButtonAtIndex:control.selectedSegmentIndex]];
}

@end
