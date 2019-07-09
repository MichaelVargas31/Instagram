//
//  LoggedInViewController.m
//  myInstagram
//
//  Created by michaelvargas on 7/8/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "LoginViewController.h"
#import "LoggedInViewController.h"
#import "AppDelegate.h"
#import "Parse/Parse.h"

@interface LoggedInViewController () <UINavigationControllerDelegate>

@end

@implementation LoggedInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/







- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        // "For logging out, use the same pattern from Twitter to switch back to the login screen when the user logs out."
        /*
         AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
         
         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
         appDelegate.window.rootViewController = loginViewController;
         */
        if (!error) {
            //            [self dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"You've successfully logged out");
            AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoggedInViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            appDelegate.window.rootViewController = loginViewController;
            
        } else {
            NSLog(@"HEY, you failed to logout. Error: %@", error.localizedDescription);
        }
        
        
    }];
}
@end
