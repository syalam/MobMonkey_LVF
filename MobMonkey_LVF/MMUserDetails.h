//
//  MMUserDetails.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MMAuthentication.h"

typedef enum {
    
    AuthenticationTypeFacebook,
    AuthenticationTypeTwitter,
    AuthenticationTypeMobMonkey

} AuthenticationType;

@interface MMUserDetailItem : NSObject {
}

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSNumber *displayOrder;
@property (nonatomic, assign) BOOL isRequired;

+(MMUserDetailItem *)detailItemWithValue:(NSString *)value placeholder:(NSString *)placeholder displayOrder:(NSNumber *)displayOrder required:(BOOL)isRequired;

@end


@interface MMUserDetails : NSObject

-(NSArray*)getUserDetailsWithAuthenticationType:(AuthenticationType)authenticationType;

@end

