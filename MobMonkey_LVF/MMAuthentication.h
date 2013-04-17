//
//  MMAuthentication.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAuthentication : NSObject


@property(readonly, assign, getter = isAuthenticated) BOOL authenticated;

/** Singleton Class for MMAuthentication object */
+(id)sharedAuth;

/** Authentication Method for Facebook with success and failure blocks
 
 @param success The success block when Facebook authentication is successful.
 @param failure The failure block when Facebook authentication is not successful.
 */
-(void)authenticateFacebookWithSuccessBlock:(void(^)(NSDictionary *userInfo))success andFailure:(void(^)(NSError *error))failure;

/** Authentication Method for Twitter with success and failure blocks
 
 @param success The success block when Twitter authentication is successful.
 @param failure The failure block when Twitter authentication is not successful.
 */
-(void)authenticateTwitterWithSuccessBlock:(void(^)(NSDictionary *userInfo))success andFailure:(void(^)(NSError *error))failure;

/** Authentication Method for MobMonkey with success and failure blocks
 
 @param success The success block when MobMonkey authentication is successful.
 @param failure The failure block when MobMonkey authentication is not successful.
 */
-(void)authenticateMobMonkeyWithSuccessBlock:(void(^)(NSDictionary *userInfo))success andFailure:(void(^)(NSError *error))failure;

@end
