//
//  LoginViewController.m
//  Squiggle
//
//  Created by Jason Fieldman on 2/18/15.
//  Copyright (c) 2015 Jason Fieldman. All rights reserved.
//

#import "LoginViewController.h"
#import <FacebookSDK.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id) init {
    if ((self = [super init])) {
        self.view.backgroundColor = [UIColor yellowColor];
        
        UILabel *helloWorldLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
        helloWorldLabel.text = @"Hello World!";
        helloWorldLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:helloWorldLabel];
        
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        loginButton.frame = CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60);
        [loginButton setTitle:@"Login with Facebook" forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(handleFacebookLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginButton];
    }
    return self;
}


- (void) handleFacebookLoginButton:(id)sender {
    NSLog(@"Hello!");
    
    [FBSession openActiveSessionWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session, FBSessionState state, NSError *error) {
         NSLog(@"Facebook Login (%d) (%@)", (int)state, error);
         NSLog(@"Logged in %d", state == FBSessionStateOpen || state == FBSessionStateOpenTokenExtended);
         
         
         
     }];
}

@end
