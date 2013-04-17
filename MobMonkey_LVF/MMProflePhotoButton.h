//
//  MMProflePhotoButton.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMProflePhotoButton;

@protocol MMProfilePhotoButtonDelegate <NSObject>

-(void)profilePhotoButton:(MMProflePhotoButton *)profilePhotoButton selectedImage:(UIImage *)profileImage;
-(void)profilePhotoButtonClearedImage:(MMProflePhotoButton *)profilePhotoButton;

@end

@interface MMProflePhotoButton : UIButton <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImageView * chooseNewPhotoImageView;
    UIImageView * profileImageView;
}

@property (nonatomic, strong) UIImage *profileImage;
@property (nonatomic, strong) UIViewController *presentingViewController;
@property (assign) id <MMProfilePhotoButtonDelegate> delegate;

@end
