//
//  DetailsViewController.h
//  myInstagram
//
//  Created by michaelvargas on 7/9/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Post *post;

@property (weak, nonatomic) IBOutlet UIImageView *detailsImageView;

@property (weak, nonatomic) IBOutlet UILabel *detailsCaptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeAgoLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
- (IBAction)didTapBack:(id)sender;


@end

NS_ASSUME_NONNULL_END
