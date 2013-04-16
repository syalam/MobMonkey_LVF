//
//  MMSignUpViewController.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSignUpViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UIButton *facebookSignUpButton;
    IBOutlet UIButton *twitterSignUpButton;
    IBOutlet UIButton *signUpButton;
    IBOutlet UITableView *credentialsTableView;
}



@end
