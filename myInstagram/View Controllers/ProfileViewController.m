//
//  ProfileViewController.m
//  myInstagram
//
//  Created by michaelvargas on 7/10/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "ProfileViewController.h"
#import "PostCollectionCell.h"
#import "Post.h"
#import "UIImageView+AFNetworking.h"
#import "Parse/Parse.h"

@interface ProfileViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postCollectionView.delegate = self;
    self.postCollectionView.dataSource = self;
    
    // formatting for the collectionView
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.postCollectionView.collectionViewLayout;
    
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    
    CGFloat postersPerLine = 3;
    CGFloat itemWidth = (self.postCollectionView.frame.size.width - layout.minimumInteritemSpacing * (postersPerLine - 1)) / postersPerLine;
    CGFloat itemHeight = itemWidth;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    // Do any additional setup after loading the view.
    self.editProfileView.layer.cornerRadius = 16;
    self.editProfileView.clipsToBounds = YES;
    
    [self fetchProfileInformation];
    [self.postCollectionView reloadData]; // This doesn't really work because its executed before the fetchProfileInformation is finished
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
            [self.postCollectionView reloadData];
        } else {
            NSLog(@"SIKE, you got an error my dude%@", error.localizedDescription);
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    MovieCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCollectionCell" forIndexPath:indexPath];
//    NSDictionary *movie = self.movies[indexPath.item];
    PostCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionCell" forIndexPath:indexPath];
    Post *post = self.postArray[indexPath.item];

    NSURL *postURL = [NSURL URLWithString:post.image.url];
    [cell.collectionCellImageView setImageWithURL:postURL];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.postArray.count;
}


@end
