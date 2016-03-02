//
//  ArrowAnimationLayer.m
//  PaintCodeExampleProjectObjC
//
//  Created by Xuan on 3/2/16.
//  Copyright © 2016 PixelCut. All rights reserved.
//

#import "ArrowAnimationLayer.h"
#import <UIKit/UIKit.h>

@implementation ArrowAnimationLayer

//- (instancetype)init
//{
//    if (self = [super init])
//    {
//        _strokeFloat = 0.0;
//    }
//    return self;
//}
//
//- (instancetype)initWithLayer: (id)layer
//{
//    if ((self = [super initWithLayer: layer]))
//    {
//        if ([layer isKindOfClass: ArrowAnimationLayer.class])
//        {
//            _strokeFloat = ((ArrowAnimationLayer *)layer).strokeFloat;
//        }
//    }
//    return self;
//}
//
//+ (BOOL)needsDisplayForKey: (NSString*)key
//{
//    if([key isEqualToString: @"strokeFloat"])
//        return YES;
//    
//    return [super needsDisplayForKey: key];
//}
//
//- (void)drawInContext: (CGContextRef)ctx
//{
//    UIGraphicsPushContext(ctx);
//    
//    [self drawArrowWithFrame:self.bounds];
//    
//    UIGraphicsPopContext();
//    
//}
//
//- (id<CAAction>)actionForKey: (NSString *)event
//{
//    
//    if([event isEqualToString: @"strokeFloat"])
//    {
//        CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath: event];
//        theAnimation.fromValue = [[self presentationLayer] valueForKey: event];
//        return theAnimation;
//    }
//    return [super actionForKey: event];
//}
//
//- (void)drawArrowWithFrame: (CGRect)frame
//{
//    
//    //// Bezier Drawing
//    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
//    
//    CGPoint startPoint = CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMinY(frame) + 0.54444 * CGRectGetHeight(frame));
//    [bezierPath moveToPoint: startPoint];
//    
//    CGPoint middlePoint = CGPointMake(CGRectGetMinX(frame) * self.strokeFloat + 0.23937 * CGRectGetWidth(frame), CGRectGetMaxY(frame) - 0.5);
//    
//    CGFloat leftK = (middlePoint.y - startPoint.y) / (middlePoint.x - startPoint.x);
//    CGFloat leftB = middlePoint.y - leftK * middlePoint.x;
//    CGFloat x = self.strokeFloat * 2 * (middlePoint.x - startPoint.x) + startPoint.x;
//    CGFloat y = leftK * x + leftB;
//    
//    CGPoint currentPoint = CGPointMake(x, y);
//    
//    CGPoint endPoint = CGPointMake(CGRectGetMinX(frame) + 0.99296 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.5);
//    
//    if (self.strokeFloat <= 0.5) {
//        [bezierPath addLineToPoint: currentPoint];
//    } else {
//        [bezierPath addLineToPoint: middlePoint];
//        [bezierPath addLineToPoint: endPoint];
//    }
//    [UIColor.blackColor setStroke];
//    bezierPath.lineWidth = 1;
//    [bezierPath stroke];
//}
//
//- (void)drawArrowCircleWithOvalFrame: (CGRect)ovalFrame startAngle: (CGFloat)startAngle endAngle: (CGFloat)endAngle
//{
//    //// Color Declarations
//    UIColor* ovalColor = [UIColor colorWithRed: 0.478 green: 0.737 blue: 0.914 alpha: 1];
//    
//    
//    //// Subframes
//    CGRect arrowFrame = CGRectMake(CGRectGetMinX(ovalFrame) + 13, CGRectGetMinY(ovalFrame) + 21, 36, 22);
//    
//    
//    //// Oval Drawing
//    CGRect ovalRect = CGRectMake(CGRectGetMinX(ovalFrame), CGRectGetMinY(ovalFrame) + 1, 64, 64);
//    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
//    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: -startAngle * M_PI/180 endAngle: -endAngle * M_PI/180 clockwise: YES];
//    
//    [ovalColor setStroke];
//    ovalPath.lineWidth = 2;
//    [ovalPath stroke];
//    
//    
//    //// Bezier Drawing
//    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
//    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(arrowFrame) + 0.5, CGRectGetMinY(arrowFrame) + 7.5)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(ovalFrame) + 26.5, CGRectGetMinY(ovalFrame) + 43.5)];
//    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(arrowFrame) + 35.5, CGRectGetMinY(arrowFrame) + 0.5)];
//    [ovalColor setStroke];
//    bezierPath.lineWidth = 2;
//    [bezierPath stroke];
//}

@end
