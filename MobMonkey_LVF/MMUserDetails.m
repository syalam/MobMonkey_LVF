//
//  MMUserDetails.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMUserDetails.h"

@implementation MMUserDetailItem

@synthesize value = _value;
@synthesize placeholder = _placeholder;
@synthesize displayOrder = _displayOrder;
@synthesize isRequired = _isRequired;

+(MMUserDetailItem *)detailItemWithValue:(NSString *)value placeholder:(NSString *)placeholder displayOrder:(NSNumber *)displayOrder required:(BOOL)isRequired{
    
    MMUserDetailItem *detailItem = [[self alloc] init];
    
    detailItem.value = value;
    detailItem.placeholder = placeholder;
    detailItem.displayOrder = displayOrder;
    detailItem.isRequired = isRequired;
    
    return detailItem;
}

@end

@implementation MMUserDetails

-(NSArray *)getUserDetailsWithAuthenticationType:(AuthenticationType)authenticationType {
    
    NSArray *userDetails;
    
    switch (authenticationType) {
            
        case AuthenticationTypeFacebook:
            userDetails = [self getFacebookUserDetails];
            break;
            
        case AuthenticationTypeTwitter:
            userDetails = [self getTwitterUserDetails];
            break;
            
        case AuthenticationTypeMobMonkey:
            userDetails = [self getMobMonkeyUserDetails];
            break;
            
        default:
            break;
    }
    
    NSSortDescriptor *sortByDisplayOrder = [NSSortDescriptor sortDescriptorWithKey:@"displayOrder" ascending:YES];
    [userDetails sortedArrayUsingDescriptors:@[sortByDisplayOrder]];
    return userDetails;
}
-(NSArray *)getFacebookUserDetails {
    //TODO: Setup up fetching facebook user details
    
    MMUserDetailItem *firstName = [MMUserDetailItem detailItemWithValue:@"Mike" placeholder:@"First Name" displayOrder:@1 required:YES];
    MMUserDetailItem *lastName = [MMUserDetailItem detailItemWithValue:@"Kral" placeholder:@"Last Name" displayOrder:@2 required:YES];
    MMUserDetailItem *email = [MMUserDetailItem detailItemWithValue:nil placeholder:@"Email Address" displayOrder:@3 required:YES];
    MMUserDetailItem *birthday = [MMUserDetailItem detailItemWithValue:@"Aug. 25, 1990" placeholder:@"Birthday" displayOrder:@4 required:YES];
    MMUserDetailItem *gender = [MMUserDetailItem detailItemWithValue:@"Male" placeholder:@"Gender" displayOrder:@5 required:NO];
    MMUserDetailItem *hometown = [MMUserDetailItem detailItemWithValue:@"Tempe, AZ" placeholder:@"Hometown" displayOrder:@6 required:NO];

    NSArray *userDetails = @[firstName, lastName, email, birthday, gender, hometown];
    
    return userDetails;
    
}
-(NSArray *)getTwitterUserDetails {
    //TODO: Setup up fetching facebook user details
    MMUserDetailItem *firstName = [MMUserDetailItem detailItemWithValue:@"Mike" placeholder:@"First Name" displayOrder:@1 required:YES];
    MMUserDetailItem *lastName = [MMUserDetailItem detailItemWithValue:@"Kral" placeholder:@"Last Name" displayOrder:@2 required:YES];
    //UserDetailItem *email =  [MMUserDetailItem detailItemWithValue:@"me@mkr.al" placeholder:@"Email Address" displayOrder:@3 required:YES];
    MMUserDetailItem *birthday =  [MMUserDetailItem detailItemWithValue:@"Aug. 25, 1990" placeholder:@"Birthday" displayOrder:@4 required:YES];
    MMUserDetailItem *gender =  [MMUserDetailItem detailItemWithValue:@"Male" placeholder:@"Gender" displayOrder:@5 required:NO];
    MMUserDetailItem *hometown =  [MMUserDetailItem detailItemWithValue:@"Tempe, AZ" placeholder:@"Hometown" displayOrder:@6 required:YES];
    
    NSArray *userDetails = @[firstName, lastName, birthday, gender, hometown];
    
    return userDetails;
}
-(NSArray *)getMobMonkeyUserDetails {
    //TODO: Setup up fetching facebook user details
    MMUserDetailItem *firstName =  [MMUserDetailItem detailItemWithValue:@"Mike" placeholder:@"First Name" displayOrder:@1 required:YES];
    MMUserDetailItem *lastName =  [MMUserDetailItem detailItemWithValue:@"Kral" placeholder:@"Last Name" displayOrder:@2 required:YES];
    //UserDetailItem *email =  [MMUserDetailItem detailItemWithValue:@"me@mkr.al" placeholder:@"Email Address" displayOrder:@3 required:YES];
    MMUserDetailItem *birthday =  [MMUserDetailItem detailItemWithValue:@"Aug. 25, 1990" placeholder:@"Birthday" displayOrder:@4 required:YES];
    MMUserDetailItem *gender =  [MMUserDetailItem detailItemWithValue:@"Male" placeholder:@"Gender" displayOrder:@5 required:NO];
    MMUserDetailItem *hometown =  [MMUserDetailItem detailItemWithValue:@"Tempe, AZ" placeholder:@"Hometown" displayOrder:@6 required:YES];
    
    NSArray *userDetails = @[firstName, lastName, birthday, gender, hometown];
    
    return userDetails;
}
@end
