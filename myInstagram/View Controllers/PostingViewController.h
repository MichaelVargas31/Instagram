//
//  PostingViewController.h
//  myInstagram
//
//  Created by michaelvargas on 7/9/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *postingTextView;
@property (weak, nonatomic) IBOutlet UIImageView *postingImageView;
- (IBAction)didTapCancel:(id)sender;

@end

NS_ASSUME_NONNULL_END
