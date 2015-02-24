//
//  MainMenuViewController.m
//  Squiggle
//
//  Created by Jason Fieldman on 2/24/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "MainMenuViewController.h"
#import "FriendSelectViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

+ (MainMenuViewController*) sharedInstance {
    __strong static MainMenuViewController *singleton = nil;
    @synchronized(self) {
        if (singleton == nil) { singleton = [[MainMenuViewController alloc] init]; }
    }
    return singleton;
}

- (id) init {
    if ((self = [super init])) {
        self.view.backgroundColor = [UIColor greenColor];
        
        self.title = @"Squiggle";
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_tableView];
        
        
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: {
            return 1;
        } break;
            
        case 1: {
            return 0;
        } break;
            
        case 2: {
            return 0;
        } break;
            
        case 3: {
            return 0;
        } break;
            
        default:
            return 0;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewGame"];
            cell.textLabel.text = @"New Game";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        } break;
            
        case 1: {
            return 0;
        } break;
            
        case 2: {
            return 0;
        } break;
            
        case 3: {
            return 0;
        } break;
            
        default:
            return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /* Check which cell was touched */
    
    if (indexPath.section == 0) {
        /* New Game cell */
        FriendSelectViewController *friendController = [[FriendSelectViewController alloc] init];
        [self.navigationController pushViewController:friendController animated:YES];
    }
}


@end
