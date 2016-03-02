//
//  EXClockView.h
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface EXClockView : UIView
@property (nonatomic) IBInspectable UIColor* clockColor;
@property (nonatomic) IBInspectable CGFloat hours;
@property (nonatomic) IBInspectable CGFloat minutes;
@property (nonatomic) IBInspectable CGFloat seconds;
@end
