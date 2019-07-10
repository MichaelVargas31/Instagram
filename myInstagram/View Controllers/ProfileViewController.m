//
//  ProfileViewController.m
//  myInstagram
//
//  Created by michaelvargas on 7/10/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "ProfileViewController.h"
#import "Parse/Parse.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editProfileView.layer.cornerRadius = 16;
    self.editProfileView.clipsToBounds = YES;
    
    [self fetchProfileInformation];
}


- (void) fetchProfileInformation {
    
    self.usernameLabel.text = PFUser.currentUser.username;
    
    // Get user's posts
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"author == %@", PFUser.currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Post" predicate:predicate];
    //    [query whereKey:@"likesCount" greaterThan:@100];
    [query includeKey:@"username"];
    [query includeKey:@"image"];
    query.limit = 20;

    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.postArray = posts;
            NSLog(@"posts recieved = %@", posts);
        } else {
            NSLog(@"SIKE, you got an error my dude%@", error.localizedDescription);
        }
    }];
    
    
    NSLog(@"Henlo");

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
