//
//  MMLoginViewController.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMLoginViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
 
    IBOutlet UIButton *newUserSignUpButton;
    IBOutlet UIButton *facebookSignInButton;
    IBOutlet UIButton *twitterSignInButton;
    IBOutlet UIButton *signInButton;
    IBOutlet UITableView *credentialInputTableView;

}

-(IBAction)newUserSignUpButtonPressed:(id)sender;
-(IBAction)facebookSignInButtonPressed:(id)sender;
-(IBAction)twitterSignInButtonPressed:(id)sender;
-(IBAction)signInButtonPressed:(id)sender;

@end
