//
//  MMSignUpViewController.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMSignUpViewController.h"

//Controllers
#import "MMEditDetailsViewController.h"

//Views
#import "MMTextInputCell.h"

//Models
#import "MMAuthentication.h"

@interface MMSignUpViewController ()

@end

@implementation MMSignUpViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushEditSettingsViewController {
    MMEditDetailsViewController *editDetailsViewController = [[MMEditDetailsViewController alloc] initWithNibName:@"MMEditDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:editDetailsViewController animated:YES];
}
#pragma mark - IBAction Methods

-(IBAction)facebookSignUpButtonPressed:(id)sender {
    
    [[MMAuthentication sharedAuth] authenticateFacebookWithSuccessBlock:^(NSDictionary *userInfo) {
        
        [self pushEditSettingsViewController];
        
    } andFailure:^(NSError *error) {
        
        NSLog(@"Facebook Authentication Failed: %@", error);
        
    }];
    
}
-(IBAction)twitterSignUpButtonPressed:(id)sender {
    
    [[MMAuthentication sharedAuth] authenticateTwitterWithSuccessBlock:^(NSDictionary *userInfo) {
        
        [self pushEditSettingsViewController];
        
    } andFailure:^(NSError *error) {
        
        NSLog(@"Twitter Authentication Failed: %@", error);
        
    }];
    
}
-(IBAction)signUpButtonPressed:(id)sender {
    
    [[MMAuthentication sharedAuth] authenticateMobMonkeyWithSuccessBlock:^(NSDictionary *userInfo) {
        
        [self pushEditSettingsViewController];
        
    } andFailure:^(NSError *error) {
        NSLog(@"MobMonkey Authentication Failed: %@", error);
    }];
}


#pragma mark - UITableView Data Source
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"MMTextInputCell";
    MMTextInputCell *cell = [credentialsTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [[MMTextInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if(indexPath.row == 0){
        cell.textField.placeholder = @"email";
    }else if (indexPath.row == 1) {
        cell.textField.placeholder = @"password";
    } else if (indexPath.row == 2) {
        cell.textField.placeholder = @"verify password";
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMTextInputCell *cell = (MMTextInputCell*)[credentialsTableView cellForRowAtIndexPath:indexPath];
    
    [cell.textField becomeFirstResponder];
    
}
@end
