//
//  MMCustomListItem.h
//  MobMonkey_LVF
//
//  Created by Michael Kral on 4/18/13.
//  Copyright (c) 2013 MobMonkey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMCustomListItem : NSObject

@property (nonatomic, strong) NSString *uniqueID;
@property (nonatomic, strong) NSString *listName;
@property (nonatomic, strong) UIImage *listImage;

@end
