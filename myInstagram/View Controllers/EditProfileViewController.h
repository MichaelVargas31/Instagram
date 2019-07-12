//
//  EditProfileViewController.h
//  myInstagram
//
//  Created by michaelvargas on 7/11/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse/Parse.h"

NS_ASSUME_NONNULL_BEGIN

@protocol EditProfileViewControllerDelegate

@end

@interface EditProfileViewController : UIViewController

@property (nonatomic, weak) id<EditProfileViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextView *editBioTextView;
@property (weak, nonatomic) Post *post;

- (IBAction)didTapBack:(id)sender;
- (IBAction)didTapSaveBio:(id)sender;

@end

NS_ASSUME_NONNULL_END
