//
//  EXViewsLayersViewController.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXViewsLayersViewController.h"
#import "StyleKit.h"
#import "EXLayer.h"


@implementation EXViewsLayersViewController


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear: animated];

	
	//Setup for UIView with custom sublayer
	EXLayer* customlayer = EXLayer.layer;
	customlayer.frame = self.viewWithCustomSubLayer.bounds;
	customlayer.contentsScale = UIScreen.mainScreen.scale;
	[self.viewWithCustomSubLayer.layer addSublayer: customlayer];
	[customlayer setNeedsDisplay];

	//Setup UIView and layer's delegate
	self.viewWithLayerDelegate.layer.delegate = self.viewWithLayerDelegate;
	self.viewWithLayerDelegate.layer.contentsScale = UIScreen.mainScreen.scale;
	[self.viewWithLayerDelegate.layer setNeedsDisplay];

	//Setup UIImageView image to match size of UIImageView
	self.imageView.image = [StyleKit imageOfBlueRectFramedWithFrame: self.imageView.bounds];
}


@end
