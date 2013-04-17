//
//  MMEditDetailsViewController.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMSocialNetworkButton.h"
#import "MMProflePhotoButton.h"

@interface MMEditDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    IBOutlet MMSocialNetworkButton *facebookButton;
    IBOutlet MMSocialNetworkButton *twitterButton;
    IBOutlet UITableView *userDetailTableView;
    IBOutlet MMProflePhotoButton *profileButton;
    IBOutlet UIButton *doneButton;
    IBOutlet UIScrollView *scrollView;
    
    NSArray *userDetails;
    
}

@end
