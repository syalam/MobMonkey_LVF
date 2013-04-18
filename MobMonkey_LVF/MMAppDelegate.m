//
//  MMAppDelegate.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMAppDelegate.h"

#import "MMViewController.h"
#import "MMLoginViewController.h"
#import "MMNavigationViewController.h"


#import <QuartzCore/QuartzCore.h>

#define app_delegate ((MMAppDelegate *)[[UIApplication sharedApplication] delegate])

@implementation MMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MMViewController *viewController = [[MMViewController alloc] initWithNibName:@"MMViewController" bundle:nil];
    
    MMNavigationViewController *navigationViewController = [[MMNavigationViewController alloc] initWithRootViewController:viewController];
    

    self.currentViewController = navigationViewController;
    
    MMSlideMenuViewController *slideMenuViewController = [[MMSlideMenuViewController alloc] initWithNibName:@"MMSlideMenuViewController" bundle:nil];
    self.slideMenuViewController = slideMenuViewController;
    
    
    self.window.rootViewController = self.currentViewController;
    
    MMLoginViewController *loginViewController = [[MMLoginViewController alloc] initWithNibName:@"MMLoginViewController" bundle:nil];
    
    UINavigationController *loginNavigationViewController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    loginNavigationViewController.navigationBar.tintColor = [UIColor colorWithRed:1.000 green:0.558 blue:0.286 alpha:1.000];
    
    [self.window makeKeyAndVisible];
    
    [self.currentViewController presentViewController:loginNavigationViewController animated:YES completion:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




-(UIImage*)screenshotForViewController:(UIViewController *)viewController{
    // before swaping the views, we'll take a "screenshot" of the current view
    // by rendering its CALayer into the an ImageContext then saving that off to a UIImage
    CGSize viewSize = viewController.view.frame.size;
    UIGraphicsBeginImageContextWithOptions(viewSize, NO, 1.0);
    [viewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // Read the UIImage object
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)startPanning{
    
}
-(void)changePanning:(CGPoint)location {
    
}
-(void)endPanning {
    
}

-(void)showSlideMenu
{
    
    UIImage *image = [self screenshotForViewController:self.currentViewController];
    
    // pass this image off to the MenuViewController then swap it in as the rootViewController
    self.slideMenuViewController.screenshotImage = image;
    self.window.rootViewController = self.slideMenuViewController;
}

-(void)dismissSlideMenu
{
    // all animation takes place elsewhere. When this gets called just swap the contentViewController in
    self.window.rootViewController = self.currentViewController;
}







@end
