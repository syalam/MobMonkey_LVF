//
//  MMAppDelegate.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMSlideMenuViewController.h"


//#define app_delegate ((MMAppDelegate *)[[UIApplication sharedApplication] delegate])

@class MMSlideMenuViewController;
@class MMNavigationViewController;

@interface MMAppDelegate : UIResponder <UIApplicationDelegate, UIGestureRecognizerDelegate>



@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MMNavigationViewController *currentViewController;
@property (nonatomic, strong) MMSlideMenuViewController *slideMenuViewController;

@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;
@property (nonatomic, assign) BOOL panningStarted;

-(void)showSlideMenu;
-(void)dismissSlideMenu;
-(void)startPanning;
-(void)endPanning;
-(void)changePanning:(CGPoint)location;
-(UIImage*)screenshotForViewController:(UIViewController *)viewController;
-(UIImage*)currentScreenshot;
-(void)handlePanGesture:(UIPanGestureRecognizer *)gesture;

@end
