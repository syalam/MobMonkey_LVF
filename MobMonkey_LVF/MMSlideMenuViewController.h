//
//  MMSlideMenuViewController.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSlideMenuViewController : UIViewController <UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate> {
}

@property (strong, nonatomic) IBOutlet UIImageView *screenshotImageView;
@property (nonatomic, strong) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) UIImage *screenshotImage;
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, assign) BOOL panning;
@property (nonatomic, strong) NSSet *setOfInitialTouches;
@property (nonatomic, strong) UIEvent *initialTouchEvent;
@property (nonatomic, assign) CGPoint touchLocation;

@property (nonatomic, strong) UIGestureRecognizer *testRecoginzer;

- (void)slideThenHide;
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer ;

@end
