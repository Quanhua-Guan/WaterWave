//
//  VWWViewController.m
//  Water Waves
//
//  Created by Veari_mac02 on 14-5-23.
//  Copyright (c) 2014年 Veari. All rights reserved.
//

#import "VWWViewController.h"
#import "VWWWaterView.h"

@interface VWWViewController ()

@end

@implementation VWWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeWaveUpdateTimeinterval:(UISlider *)sender {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[VWWWaterView class]]) {
            ((VWWWaterView *)view).waveUpdateTimeinterval = sender.value;
        }
    }
}

- (IBAction)changeWaveMoveSpeed:(UISlider *)sender {
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[VWWWaterView class]]) {
            ((VWWWaterView *)view).waveMoveSpeed = sender.value;
        }
    }
}

@end
