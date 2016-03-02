//
//  EXTabBarsAndButtonsViewController.m
//  PaintCodeExampleProject
//
//  Copyright (c) 2015 PixelCut s.r.o. All rights reserved.
//

#import "EXTabBarsAndButtonsViewController.h"
#import "StyleKit.h"


@implementation EXTabBarsAndButtonsViewController


- (void)viewWillAppear: (BOOL)animated
{
	[super viewWillAppear: animated];
	
	//Customization code for UITabBar
	self.tabBar.backgroundImage = StyleKit.imageOfTabBarBackground;
	self.tabBar.selectionIndicatorImage = StyleKit.imageOfSelectionIndicator;
	self.tabBar.shadowImage = StyleKit.imageOfShadowImage;
	[self.tabBar setSelectedItem: self.tabBar.items.firstObject];

	
	//Customization code for UIButton
	//Use similar approach for other customizable controls
	[self.button setBackgroundImage: [StyleKit imageOfButtonWithSelected: NO highlighted: NO ] forState: UIControlStateNormal];
	[self.button setBackgroundImage: [StyleKit imageOfButtonWithSelected: NO highlighted: YES ] forState: UIControlStateHighlighted];
	[self.button setBackgroundImage: [StyleKit imageOfButtonWithSelected: YES highlighted: NO ] forState: UIControlStateSelected];
	[self.button setBackgroundImage: [StyleKit imageOfButtonWithSelected: YES highlighted: YES ] forState: UIControlStateHighlighted | UIControlStateSelected];


	//Set a image to bag UIImageView and send a custom color as a parameter of StyleKit imageOf... method
	self.bagOne.image = [StyleKit imageOfBagWithBagColor: UIColor.redColor];
	self.bagTwo.image = [StyleKit imageOfBagWithBagColor: UIColor.greenColor];
	self.bagThree.image = [StyleKit imageOfBagWithBagColor: UIColor.blueColor];
}

- (IBAction)buttonPressed: (id)sender
{
	self.button.selected = !self.button.selected;
}

@end
