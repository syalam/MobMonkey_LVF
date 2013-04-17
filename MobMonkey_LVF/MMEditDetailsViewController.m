//
//  MMEditDetailsViewController.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMEditDetailsViewController.h"
#import "MMUserDetails.h"
#import "MMTextInputCell.h"

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
    
    MMUserDetails *userDetailModel = [[MMUserDetails alloc] init];
    userDetails = [userDetailModel getUserDetailsWithAuthenticationType:AuthenticationTypeFacebook];
    
    profileButton.presentingViewController = self;
    [userDetailTableView reloadData];
    
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, doneButton.frame.origin.y + doneButton.frame.size.height + 20);
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Data Source
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"MMTextInputCell";
    MMTextInputCell *cell = [userDetailTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [[MMTextInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    MMUserDetailItem *detailItem = [userDetails objectAtIndex:indexPath.row];
    
    UIImageView *statusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 14, 14)];
    //If there is a value set the textfield, else use placeholder
    if(detailItem.value){
        cell.textField.text = detailItem.value;
        statusImageView.image = [UIImage imageNamed:@"greenCheck.png"];
        statusImageView.frame = CGRectMake(0, 0, 10, 10);
        cell.accessoryView = statusImageView;
    } else {
        cell.textField.placeholder = detailItem.placeholder;
        if(detailItem.isRequired){
            statusImageView.image = [UIImage imageNamed:@"redCircleNo.png"];
            cell.accessoryView = statusImageView;
        }
    }
    
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return userDetails.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMTextInputCell *cell = (MMTextInputCell*)[userDetailTableView cellForRowAtIndexPath:indexPath];
    
    [cell.textField becomeFirstResponder];
    
}

@end
