//
//  VWWWaterView.m
//  Water Waves
//
//  Created by Veari_mac02 on 14-5-23.
//  Copyright (c) 2014年 Veari. All rights reserved.
//

#import "VWWWaterView.h"

@interface VWWWaterView ()
{
    CGFloat waveAmplitudeAdjustValue;
    CGFloat xAxisShift;
    BOOL shouldAddWaveAmplitudeAdjustValue;
    NSTimer *waveUpdateTimer;
}
@end


@implementation VWWWaterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        waveAmplitudeAdjustValue = 1.5;
        xAxisShift = 0;
        shouldAddWaveAmplitudeAdjustValue = NO;
        
        _waveColor = [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
        _waveHeight = 250;
        _waveAmplitude = 5.0f;
        _waveAmplitudeRange = 1.5;
        _waveCycle = 300;
        _waveUpdateTimeinterval = 0.075;
        _waveMoveSpeed = 0.025;
        
        [self setUp];
    }
    return self;
}

- (void)setUp {
    waveUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:_waveUpdateTimeinterval target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
}

-(void)animateWave
{
    if (shouldAddWaveAmplitudeAdjustValue) {
        waveAmplitudeAdjustValue += 0.01;
    }else{
        waveAmplitudeAdjustValue -= 0.01;
    }
    
    if (waveAmplitudeAdjustValue <= -_waveAmplitudeRange) {
        shouldAddWaveAmplitudeAdjustValue = YES;
    }
    
    if (waveAmplitudeAdjustValue >= _waveAmplitudeRange) {
        shouldAddWaveAmplitudeAdjustValue = NO;
    }
    
    xAxisShift += _waveMoveSpeed;
    if (xAxisShift >= _waveCycle) {
        xAxisShift = 0;
    }
    
    [self setNeedsDisplay];
}

- (void)setWaveUpdateTimeinterval:(CGFloat)waveUpdateTimeinterval {
    _waveUpdateTimeinterval = waveUpdateTimeinterval;
    [waveUpdateTimer invalidate];
    [self setUp];
}

#if TARGET_INTERFACE_BUILDER
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview: newSuperview];
    
    [self setUp];
}
#else
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUp];
}
#endif

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_waveColor CGColor]);
    
    CGFloat y = _waveHeight;
    CGPathMoveToPoint(path, NULL, 0, y);
    
    CGFloat z = (_waveAmplitude + waveAmplitudeAdjustValue);
    CGFloat a = (2 * M_PI / _waveCycle);
    CGFloat h = (rect.size.height - _waveHeight);
    for(CGFloat x = 0; x <= rect.size.width; x++){
        y = z * sinf(a * x + xAxisShift) + h;
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    
    CGPathAddLineToPoint(path, NULL, rect.size.width, rect.size.height);
    CGPathAddLineToPoint(path, NULL, 0, rect.size.height);
    CGPathAddLineToPoint(path, NULL, 0, rect.size.height - _waveHeight);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    
    CGPathRelease(path);
}

@end
