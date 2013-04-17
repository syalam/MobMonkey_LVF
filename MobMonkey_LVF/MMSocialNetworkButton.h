//
//  MMSocialNetworkButton.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMSocialNetworkButton;

@protocol MMSocialNetworkButtonDelegate <NSObject>

@optional
-(void)socialNetworkButton:(MMSocialNetworkButton *)socialNetworkButton authenticationSuccessful:(BOOL)successful;

@end

typedef enum {
    SocialNetworkTypeFacebook = 1,
    SocialNetworkTypeTwitter
} SocialNetworkType;

@interface MMSocialNetworkButton : UIButton {
    void (^successAction)();
    void (^failureAction)();
    UIImageView *icon;
}

@property (copy, nonatomic) void (^successAction)();
@property (copy, nonatomic) void (^failureAction)();
@property (nonatomic, assign) id <MMSocialNetworkButtonDelegate> delegate;
@property (nonatomic, assign) SocialNetworkType socialNetworkType;

@end
