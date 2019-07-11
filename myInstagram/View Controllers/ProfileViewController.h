//
//  ProfileViewController.h
//  myInstagram
//
//  Created by michaelvargas on 7/10/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *editProfileView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIButton *didTapEditProfile;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *postCollectionView;

@property (strong, nonatomic) NSArray *postArray;



@end

NS_ASSUME_NONNULL_END
