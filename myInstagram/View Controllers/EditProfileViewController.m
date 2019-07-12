//
//  EditProfileViewController.m
//  myInstagram
//
//  Created by michaelvargas on 7/11/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

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

- (IBAction)didTapBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapSaveBio:(id)sender {
    
    PFUser.currentUser[@"bio"] = self.editBioTextView.text;
    
    [self.post saveInBackground];
    [self dismissViewControllerAnimated:YES completion:nil];
    

}
@end
