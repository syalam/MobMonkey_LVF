//
//  MMTextInputCell.m
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/16/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import "MMTextInputCell.h"

@implementation MMTextInputCell

@synthesize textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        CGRect textViewFrame = self.bounds;
        
        CGFloat padding = 5.0f;
        CGFloat textViewHeight = 20.0f;
        
        textViewFrame.origin.x += padding;
        textViewFrame.size.width -= padding * 2 + 75;
        textViewFrame.size.height = textViewHeight;
        textViewFrame.origin.y += (self.bounds.size.height - textViewHeight)/2;
        
        textField = [[UITextField alloc] initWithFrame:textViewFrame];
        textField.font = [UIFont fontWithName:@"Helvetica" size:16.0f];
        [textField setClearButtonMode:UITextFieldViewModeWhileEditing];

        [self.contentView addSubview:textField];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
