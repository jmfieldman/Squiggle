//
//  FriendManager.m
//  Snap Roulette
//
//  Created by Jason Fieldman on 2/26/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "FriendManager.h"

@implementation FriendManager

+ (FriendManager*) sharedInstance {
    __strong static FriendManager *singleton = nil;
    @synchronized(self) {
        if (singleton == nil) singleton = [[FriendManager alloc] init];
    }
    return singleton;
}

- (id) init {
    if ((self = [super init])) {
        
        _parseFriends = [NSMutableArray array];
        _facebookFriends = [NSMutableArray array];
        
    }
    return self;
}

- (void) loadFriends {
    // Issue a Facebook Graph API request to get your user's friend list
    [FBRequestConnection startForMyFriendsWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // result will contain an array with your user's friends in the "data" key
            NSArray *friendObjects = [result objectForKey:@"data"];
            NSMutableArray *friendIds = [NSMutableArray arrayWithCapacity:friendObjects.count];
            // Create a list of friends' Facebook IDs
            for (NSDictionary *friendObject in friendObjects) {
                [friendIds addObject:[friendObject objectForKey:@"id"]];
            }
            
            _facebookFriends = [NSMutableArray arrayWithArray:friendObjects];
            
            // Construct a PFUser query that will find friends whose facebook ids
            // are contained in the current user's friend list.
            PFQuery *friendQuery = [PFUser query];
            [friendQuery whereKey:@"fbId" containedIn:friendIds];
            
            // findObjects will return a list of PFUsers that are friends
            // with the current user
            [friendQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                _parseFriends = [NSMutableArray arrayWithArray:objects];
                
                NSLog(@"facebook: %@ ; parse: %@", _facebookFriends, _parseFriends);
            }];
        }
    }];
}

@end
