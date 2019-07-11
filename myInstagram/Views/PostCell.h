//
//  PostCell.h
//  myInstagram
//
//  Created by michaelvargas on 7/9/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell

//@property (nonatomic, weak) id<PostCellDelegate> delegate;
//@property (nonatomic, weak) id<PostCellDelegate> delegate;


@property (strong, nonatomic) Post *post;

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeAgoLabel;

- (IBAction)didTapLike:(id)sender;

@end

NS_ASSUME_NONNULL_END
