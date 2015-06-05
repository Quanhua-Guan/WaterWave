//
//  VWWWaterView.h
//  Water Waves
//
//  Created by Veari_mac02 on 14-5-23.
//  Copyright (c) 2014年 Veari. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface VWWWaterView : UIView

@property (nonatomic, readwrite, strong) IBInspectable UIColor *waveColor;
@property (nonatomic, readwrite, assign) IBInspectable CGFloat waveHeight;
@property (nonatomic, readwrite, assign) IBInspectable CGFloat waveAmplitude;
@property (nonatomic, readwrite, assign) IBInspectable CGFloat waveAmplitudeRange;
@property (nonatomic, readwrite, assign) IBInspectable CGFloat waveCycle;
@property (nonatomic, readwrite, assign) IBInspectable CGFloat waveUpdateTimeinterval;
@property (nonatomic, readwrite, assign) IBInspectable CGFloat waveMoveSpeed;

@end
