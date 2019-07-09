//
//  PostingViewController.m
//  myInstagram
//
//  Created by michaelvargas on 7/9/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "PostingViewController.h"
#import "LoggedInViewController.h"
#import "AppDelegate.h"
#import "Post.h"

@interface PostingViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)didTapShare:(id)sender;

@end

@implementation PostingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Instantiating an Image Picker
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}





- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    // Do something with the images (based on your use case)
    [self resizeImage:editedImage withSize:CGSizeMake(100, 100)];
    self.postingImageView.image = editedImage;
    
    
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// This doesn't actually work correctly....
- (IBAction)didTapCancel:(id)sender {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    LoggedInViewController *loggedInViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoggedInViewController"];
//    appDelegate.window.rootViewController = loggedInViewController;
    
    [self dismissViewControllerAnimated:true completion:nil];

}

- (IBAction)didTapShare:(id)sender {
    [Post postUserImage:self.postingImageView.image withCaption:_postingTextView.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"Successfully posting image");
            [self dismissViewControllerAnimated:true completion:nil];

        } else {
            NSLog(@"😫 Error coming from postingViewController (didTapShare): %@", error.localizedDescription);

        }
    }];
    
}

@end
