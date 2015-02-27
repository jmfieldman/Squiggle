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
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
