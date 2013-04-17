//
//  MMSocialNetworkButton.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMSocialNetworkButton.h"

@interface MMSocialNetworkButton ()

//@property (nonatomic, strong) UIImageView * icon;

@end

@implementation MMSocialNetworkButton

@synthesize successAction;
@synthesize failureAction;
@synthesize delegate;
@synthesize socialNetworkType = _socialNetworkType;
//@synthesize icon = _icon;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        

    }
    return self;
}
-(void)awakeFromNib {
    
    [super awakeFromNib];
    
    icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 34, 34)];
    icon.backgroundColor = [UIColor redColor];
    [self addSubview:icon];
    
}

-(void)setSocialNetworkType:(SocialNetworkType)socialNetworkType{
    
    if (socialNetworkType == SocialNetworkTypeFacebook) {
        
        self.backgroundColor = [UIColor colorWithRed:0.290 green:0.431 blue:0.663 alpha:1.000];
        [icon setImage:[UIImage imageNamed:@"facebook-icon.png"]];
        
    }else if(socialNetworkType == SocialNetworkTypeTwitter) {
        
        self.backgroundColor = [UIColor colorWithRed:0.000 green:0.675 blue:0.929 alpha:1.000];
        [icon setImage:[UIImage imageNamed:@"twitter-icon.png"]];
    
    }
    
    _socialNetworkType = socialNetworkType;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
