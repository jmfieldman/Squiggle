//
//  FriendManager.h
//  Snap Roulette
//
//  Created by Jason Fieldman on 2/26/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendManager : NSObject

@property (nonatomic, strong) NSMutableArray *facebookFriends;
@property (nonatomic, strong) NSMutableArray *parseFriends;

+ (FriendManager*) sharedInstance;

- (void) loadFriends;

@end
