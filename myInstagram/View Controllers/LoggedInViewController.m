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
#import "PostCell.h"
#import "Post.h"


@interface LoggedInViewController () <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation LoggedInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchPosts];
    NSLog(@"got posts");
    
    self.timelineTableView.delegate = self;
    self.timelineTableView.dataSource = self;
    
    [self.timelineTableView reloadData];
    
    
}


- (void) fetchPosts {
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
//    [query whereKey:@"likesCount" greaterThan:@100];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"author"];

    query.limit = 20;
    
    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.postArray = posts;
            NSLog(@"got posts");
            [self.timelineTableView reloadData];
        } else {
            NSLog(@"Error getting posts%@", error.localizedDescription);
        }
    }];
    [self.timelineTableView reloadData];
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



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postArray.count;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *newPostCell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
//    Tweet *tweet = self.tweetArray[indexPath.row];
    Post *post = self.postArray[indexPath.row];

    
//    newPostCell.postImageView.image = post.image;
    newPostCell.postLabel.text = post.caption;
    
    return newPostCell;
}



@end
