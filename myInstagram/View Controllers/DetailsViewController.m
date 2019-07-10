//
//  DetailsViewController.m
//  myInstagram
//
//  Created by michaelvargas on 7/9/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"post");
    self.usernameLabel = post.userID;
    // for time: timeago is on parsedashboard, you can still access using .createdAt
    
    
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
