//
//  MMNavigationViewController.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMNavigationViewController : UINavigationController <UIGestureRecognizerDelegate> {
    UIImageView *backgroundImageView;
}

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end
