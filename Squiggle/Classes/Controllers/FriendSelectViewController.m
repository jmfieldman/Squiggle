//
//  FriendSelectViewController.m
//  Squiggle
//
//  Created by Jason Fieldman on 2/24/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "FriendSelectViewController.h"
#import <FacebookSDK.h>
#import <Parse/Parse.h>

@interface FriendSelectViewController ()

@end

@implementation FriendSelectViewController

- (id) init {
    if ((self = [super init])) {
        self.view.backgroundColor = [UIColor cyanColor];
        
        self.title = @"Choose Friend";
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_tableView];
        
        
        
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [FriendManager sharedInstance].facebookFriends.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *friend = [FriendManager sharedInstance].facebookFriends[indexPath.row];
    
    NSString *profile_pic = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture", friend[@"id"]];
    NSLog(@"url: %@", profile_pic);
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Hello"];
    cell.textLabel.text = friend[@"name"];

    UIGraphicsBeginImageContext(CGSizeMake(60, 60));
    UIImage *foo = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.imageView.image = foo;
    
    //NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:profile_pic]];
    //cell.imageView.image = [UIImage imageWithData:data];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:profile_pic] placeholderImage:foo];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PFObject *game = [PFObject objectWithClassName:@"Game"];
    game[@"player1"] = [PFUser currentUser];
    game[@"player2"] = [FriendManager sharedInstance].parseFriends[indexPath.row];
    //game[@"currentRound"] = ;
    [game saveInBackground];
    
}

@end
