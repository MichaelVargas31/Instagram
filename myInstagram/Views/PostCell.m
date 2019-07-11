//
//  PostCell.m
//  myInstagram
//
//  Created by michaelvargas on 7/9/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import "Parse/Parse.h"
#import "UIImageView+AFNetworking.h"


@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didTapLike:(id)sender {
    [self.post likePost];
    [self reloadCellData];
}

- (void) reloadCellData {
    self.usernameLabel.text = self.post.author.username;
    
    NSURL *imageURL = [NSURL URLWithString:self.post.image.url];
    [self.postImageView setImageWithURL:imageURL];
    
    self.postLabel.text = self.post.caption;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@ likes", self.post.likeCount];
        
}

@end
