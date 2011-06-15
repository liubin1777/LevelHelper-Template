//
//  AppDelegate.h
//  LevelHelper
//
//  Created by Andy Girvan on 13/06/2011.
//  Copyright Wicked Little Games 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
