//
//  RegisterViewController.m
//  myInstagram
//
//  Created by michaelvargas on 7/8/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoggedInViewController.h"
#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//
//- (void)registerUser {
//    // initialize a user object
//    PFUser *newUser = [PFUser user];
//
//    // set user properties
//    newUser.username = self.usernameField.text;
//    newUser.email = self.emailField.text;
//    newUser.password = self.passwordField.text;
//    
//    // call sign up function on the object
//    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
//        if (error != nil) {
//            NSLog(@"Error: %@", error.localizedDescription);
//        } else {
//            NSLog(@"User %@ registered successfully", newUser.username);
//            // manually segue to logged in view
//
//        }
//    }];
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
////    LoginViewController *logInViewController = [segue destinationViewController];
//
//}

- (IBAction)didTapSignUp:(id)sender {
    [self registerUser];
}

- (IBAction)didTapOut:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)didTapCancel:(id)sender {
     // [self performSegueWithIdentifier:@"backToLoginSegue" sender:nil];
    [self dismissViewControllerAnimated:YES
                             completion:^{
                             }];
}


- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.email = self.emailField.text;
    newUser.password = self.passwordField.text;
    
    NSLog(@"%@", newUser.username);
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@" ‼️ Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            // manually segue to logged in view
            [self performSegueWithIdentifier:@"backToLoginSegue" sender:nil];
        }
    }];
}

@end
