//
//  MMEditDetailsViewController.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMEditDetailsViewController.h"

@interface MMEditDetailsViewController ()

@end

@implementation MMEditDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    facebookButton.socialNetworkType = SocialNetworkTypeFacebook;
    twitterButton.socialNetworkType = SocialNetworkTypeTwitter;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
