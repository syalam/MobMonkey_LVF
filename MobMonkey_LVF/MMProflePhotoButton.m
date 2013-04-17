//
//  MMProflePhotoButton.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/17/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMProflePhotoButton.h"

#import <UIActionSheet+Blocks.h>

#import <QuartzCore/QuartzCore.h>

@implementation MMProflePhotoButton

@synthesize presentingViewController;
@synthesize profileImage = _profileImage;
@synthesize delegate;

-(void)setup {
    float photoIconSize = 34.0f;
    
    self.backgroundColor = [UIColor clearColor];
    chooseNewPhotoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - photoIconSize)/2, (self.frame.size.height - photoIconSize)/2, photoIconSize, photoIconSize)];
    chooseNewPhotoImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [chooseNewPhotoImageView setImage:[UIImage imageNamed:@"camera.png"]];
    
    
    CGFloat tapSize = 44.0f;
    CGFloat clearImageSize = 22.0f;
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, tapSize, tapSize)];
    UIImageView *clearButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake((tapSize-clearImageSize)/2, (tapSize-clearImageSize)/2, clearImageSize, clearImageSize)];
    [clearButtonImageView setImage:[UIImage imageNamed:@"redCircleX.png"]];
    
    [clearButton addSubview:clearButtonImageView];
    
    
    
    profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(tapSize/2, tapSize/2, self.bounds.size.width - tapSize, self.bounds.size.height - tapSize)];
    profileImageView.layer.borderWidth = 1.0;
    profileImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    profileImageView.backgroundColor = [UIColor colorWithWhite:0.864 alpha:1.000];
    
    clearButton.frame = CGRectMake(profileImageView.frame.size.width,0, tapSize, tapSize);
    [clearButton addTarget:self action:@selector(clearButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self addSubview:profileImageView];
    [self addSubview:chooseNewPhotoImageView];
    [self addSubview:clearButton];
    
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
        
    }
    return self;
}
-(void)awakeFromNib {
    
    [super awakeFromNib];
    
    [self setup];
}
-(void)clearButtonPressed:(id)sender{
    if([self.delegate respondsToSelector:@selector(profilePhotoButtonClearedImage:)]){
        [self.delegate profilePhotoButtonClearedImage:self];
    }
    self.profileImage = nil;
}
-(void)buttonPressed:(id)sender{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    imagePicker.allowsEditing = YES;
    
    //Check if the device has camera capabilities
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        RIButtonItem *cancelItem = [RIButtonItem itemWithLabel:@"Cancel"];
        RIButtonItem *cameraButton = [RIButtonItem itemWithLabel:@"From Camera"];
        RIButtonItem *libraryButton = [RIButtonItem itemWithLabel:@"From Library"];
        
        [cameraButton setAction:^{
            
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [presentingViewController presentViewController:imagePicker animated:YES completion:nil];
        
        }];
        
        [libraryButton setAction:^{
        
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [presentingViewController presentViewController:imagePicker animated:YES completion:nil];
        
        }];
        
        UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@"Camera Options" cancelButtonItem:cancelItem destructiveButtonItem:nil otherButtonItems:cameraButton, libraryButton, nil];
        [actionsheet showInView:presentingViewController.view];
    
    } else {
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [presentingViewController presentViewController:imagePicker animated:YES completion:nil];
    
    }
    
}
-(void)setProfileImage:(UIImage *)profileImage {
    [profileImageView setImage:profileImage];
    _profileImage = profileImage;
}
#pragma mark - Image View Picker Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *edittedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    if([self.delegate respondsToSelector:@selector(profilePhotoButton:selectedImage:)]){
        [self.delegate profilePhotoButton:self selectedImage:edittedImage];
    }
    

    [picker dismissViewControllerAnimated:YES completion:^{
        self.profileImage = edittedImage;
    }];
    
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
