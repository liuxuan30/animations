//
//  EXAnimationViewController.h
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXClockView.h"

@interface EXAnimationViewController : UIViewController
@property  IBOutlet UIView* buttonView;
@property  (nonatomic, strong) IBOutletCollection(EXClockView) NSArray* clockViews;


- (IBAction)animateButton: (id)sender;

@end
