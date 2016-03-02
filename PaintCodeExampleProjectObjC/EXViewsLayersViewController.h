//
//  EXViewsLayersViewController.h
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EXBasicViewTwo.h"

@interface EXViewsLayersViewController : UIViewController
@property	(weak) IBOutlet UIImageView* imageView;
@property  	(weak) IBOutlet UIView* viewWithCustomSubLayer;
@property  	(weak) IBOutlet EXBasicViewTwo* viewWithLayerDelegate;


@end

