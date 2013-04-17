//
//  MMAuthentication.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMAuthentication.h"

@implementation MMAuthentication

@synthesize  authenticated = _authenticated;

+(id)sharedAuth {
    static MMAuthentication *sharedAuth = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedAuth = [[self alloc] init];
    });
    
    return sharedAuth;
}

-(void)authenticateFacebookWithSuccessBlock:(void (^)(NSDictionary *))success andFailure:(void (^)(NSError *))failure {
    
    //TODO: Logic for facebook authentication, currently returns always successful
    
    _authenticated = YES;
    
    success(nil);

}

-(void)authenticateTwitterWithSuccessBlock:(void (^)(NSDictionary *))success andFailure:(void (^)(NSError *))failure {
    
    //TODO: Logic for twitter authentication, currently returns always successful
    
    _authenticated = YES;
    
    success(nil);

}

-(void)authenticateMobMonkeyWithSuccessBlock:(void (^)(NSDictionary *))success andFailure:(void (^)(NSError *))failure {
    
    //TODO: Logic for MobMonket authentication, currently returns always successful
    
    _authenticated = YES;
    
    success(nil);
}

@end
