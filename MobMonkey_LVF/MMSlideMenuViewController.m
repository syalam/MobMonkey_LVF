//
//  MMSlideMenuViewController.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMSlideMenuViewController.h"
#import "MMAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface MMSlideMenuViewController ()

@end

@implementation MMSlideMenuViewController

@synthesize screenshotImageView, tapGesture, panGesture, searchBar, panning, testRecoginzer, setOfInitialTouches, touchLocation = _touchLocation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch");
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"TOUCHING");
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.userInteractionEnabled = YES;
    
    self.menuTableView.exclusiveTouch = NO;
    
    // create a UITapGestureRecognizer to detect when the screenshot recieves a single tap
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapScreenShot:)];
    [screenshotImageView addGestureRecognizer:tapGesture];
    
    // create a UIPanGestureRecognizer to detect when the screenshot is touched and dragged
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture setDelegate:self];

    [screenshotImageView addGestureRecognizer:panGesture];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 265, 34)];
    [searchBar setBackgroundImage:[UIImage new]];
    [searchBar setTranslucent:YES];
    [searchBar setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.500]];
    
    self.menuTableView.tableHeaderView = searchBar;
    
    
    
    UIImage *image = [UIImage imageNamed:@"darkLinenBackground.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:self.menuTableView.bounds];
    [self.menuTableView setBackgroundView:imageView];
    [self.menuTableView setBackgroundColor:[UIColor clearColor]];
    self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)setTouchLocation:(CGPoint)touchLocation{
    
    
    
    _touchLocation = touchLocation;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // remove the gesture recognizers
    [self.screenshotImageView removeGestureRecognizer:self.tapGesture];
    [self.screenshotImageView removeGestureRecognizer:self.panGesture];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // when the menu view appears, it will create the illusion that the other view has slide to the side
    // what its actually doing is sliding the screenShotImage passed in off to the side
    // to start this, we always want the image to be the entire screen, so set it there
    
    [screenshotImageView.layer setAnchorPoint:CGPointMake(0.5, 0.5)];
    [screenshotImageView setImage:self.screenshotImage];
    [screenshotImageView setFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height+20)];
    
    // now we'll animate it across to the right over 0.2 seconds with an Ease In and Out curve
    // this uses blocks to do the animation. Inside the block the frame of the UIImageView has its
    // x value changed to where it will end up with the animation is complete.
    // this animation doesn't require any action when completed so the block is left empty
    
    
    if(!panning){
        
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [screenshotImageView setFrame:CGRectMake(265, -20, self.view.frame.size.width, self.view.frame.size.height + 20)];
        } completion:^(BOOL finished){  }];
        
    }else{
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [screenshotImageView setFrame:CGRectMake(265, -20, self.view.frame.size.width, self.view.frame.size.height + 20)];
        } completion:^(BOOL finished){  }];
    }
    
}

-(void) slideThenHide
{
    // this animates the screenshot back to the left before telling the app delegate to swap out the MenuViewController
    // it tells the app delegate using the completion block of the animation
    //[screenshotImageView setFrame:CGRectMake(265, -20, self.view.frame.size.width, self.view.frame.size.height+20)];
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [screenshotImageView setFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height+20)];
    }
                     completion:^(BOOL finished){ [app_delegate dismissSlideMenu]; }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)singleTapScreenShot:(UITapGestureRecognizer *)gestureRecognizer
{
    // on a single tap of the screenshot, assume the user is done viewing the menu
    // and call the slideThenHide function
    [self slideThenHide];
}


/* The following is from http://blog.shoguniphicus.com/2011/06/15/working-with-uigesturerecognizers-uipangesturerecognizer-uipinchgesturerecognizer/ */

-(void)panGestureMoveAround:(UIPanGestureRecognizer *)gesture
{
    UIView *piece = [gesture view];
    [self adjustAnchorPointForGestureRecognizer:gesture];
    
    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [gesture translationInView:[piece superview]];
        CGPoint touchLocation = [gesture locationInView:piece.superview];
        CGFloat offset = touchLocation.x - piece.frame.origin.x;
        
        CGPoint newPoint = CGPointMake([piece center].x + translation.x, [piece center].y);
       // NSLog(@"local: %f",(localTranslation.x + piece.center.x));
        //NSLog(@"newpoint: %f", newPoint.x - offset);
        if(newPoint.x - offset + translation.x > 0 && newPoint.x - offset + translation.x < 265){
            // I edited this line so that the image view cannont move vertically
            [piece setCenter:newPoint];
            [gesture setTranslation:CGPointZero inView:[piece superview]];
        }else if (newPoint.x - offset +translation.x > 265){
            piece.frame = CGRectMake(265, -20, self.view.frame.size.width, self.view.frame.size.height+20);
        }else {
            piece.frame = CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height+20);
        }
        
    }
    else if ([gesture state] == UIGestureRecognizerStateEnded) {
        
        if(piece.frame.origin.x < self.view.frame.size.width/2.6){
            [self slideThenHide];
        }else{
            [self slideBack];
        }
        
    }
        
}
-(void)slideBack{
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [screenshotImageView setFrame:CGRectMake(265, -20, self.view.frame.size.width, self.view.frame.size.height+20)];
    }
                     completion:^(BOOL finished){ }];
}
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }else if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
       /* UIView *piece = gestureRecognizer.view;
        piece.layer.anchorPoint = CGPointZero;
        piece.center = C*/
    }
}

#pragma mark - Table View Data Source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MenuCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UIView *cellBackgroundView = [[UIView alloc] init];
        [cellBackgroundView setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.500]];
        cell.opaque = NO;
        [cell setBackgroundView:cellBackgroundView];
    }
    
    return cell;
    
}
@end
