//
//  MMLoginViewController.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMLoginViewController.h"

#import "MMTextInputCell.h"

#import "MMSignUpViewController.h"

@interface MMLoginViewController ()

@end

@implementation MMLoginViewController

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
#pragma mark - IBAction Methods

-(IBAction)newUserSignUpButtonPressed:(id)sender {
    
    MMSignUpViewController *signUpViewController = [[MMSignUpViewController alloc] initWithNibName:@"MMSignUpViewController" bundle:nil];
    
    [self.navigationController pushViewController:signUpViewController animated:YES];
    
}
-(IBAction)facebookSignInButtonPressed:(id)sender {
    
}
-(IBAction)twitterSignInButtonPressed:(id)sender {
    
}
-(IBAction)signInButtonPressed:(id)sender {
    
}
 
#pragma mark - UITableView Data Source
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"MMTextInputCell";
    MMTextInputCell *cell = [credentialInputTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [[MMTextInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if(indexPath.row == 0){
        cell.textField.placeholder = @"email";
    }else if (indexPath.row == 1) {
        cell.textField.placeholder = @"password";
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark - UITableViewDelegate
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMTextInputCell *cell = (MMTextInputCell*)[credentialInputTableView cellForRowAtIndexPath:indexPath];
    
    [cell.textField becomeFirstResponder];
    
}

@end
