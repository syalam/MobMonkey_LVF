//
//  MMNavigationViewController.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMNavigationViewController.h"

#import "MMAppDelegate.h"

@interface MMNavigationViewController ()

@end

@implementation MMNavigationViewController

@synthesize panGesture;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    self.navigationBar.tintColor = [UIColor colorWithRed:1.000 green:0.558 blue:0.286 alpha:1.000];
    if(self){
    
        UIImageView *menuImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteList.png"]];

       // UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuImageView];
        UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"whiteList.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(menuButtonPressed:)];
        
        rootViewController.navigationItem.leftBarButtonItem = menuItem;
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
    [self.view addGestureRecognizer:panGesture];
    
}
-(void)viewDidUnload{
    [super viewDidUnload];
    
    [self.view removeGestureRecognizer:panGesture];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menuButtonPressed:(id)sender{
    [app_delegate showSlideMenu];
}
-(void)panGestureMoveAround:(UIPanGestureRecognizer *)gesture {
    
    
    if(gesture.state == UIGestureRecognizerStateBegan){
        [app_delegate startPanning];
    }else if(gesture.state == UIGestureRecognizerStateEnded) {
        [app_delegate endPanning];
    }else if(gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [gesture locationInView:self.view];
        [app_delegate changePanning:location];
    }

}

@end
