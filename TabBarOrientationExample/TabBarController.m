//
//  TabBarController.m
//  TabBarOrientationExample
//
//  Created by pronebird on 01/12/14.
//  Copyright (c) 2014 codeispoetry.ru. All rights reserved.
//

#import "TabBarController.h"

static const NSInteger kPortraitOnlyTabIndex = 1;

@implementation TabBarController

- (id)initWithCoder:(NSCoder *)aDecoder {
	if(self = [super initWithCoder:aDecoder]) {
		self.delegate = self;
	}
	return self;
}

- (NSUInteger)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController {
	if(tabBarController.selectedIndex == kPortraitOnlyTabIndex) {
		return UIInterfaceOrientationMaskPortrait;
	}

	return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
	[UIViewController attemptRotationToDeviceOrientation];

	if([self.viewControllers indexOfObject:viewController] == kPortraitOnlyTabIndex) {
		SEL sel = NSSelectorFromString(@"setOrientation:");
		if([[UIDevice currentDevice] respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
			[[UIDevice currentDevice] performSelector:sel withObject:(__bridge id)((void*)UIInterfaceOrientationPortrait)];
#pragma clang diagnostic pop
		}
	}
}

@end
