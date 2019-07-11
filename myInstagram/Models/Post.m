//
//  Post.m
//  myInstagram
//
//  Created by michaelvargas on 7/9/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "Post.h"
#import "Parse/Parse.h"



@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic likedByList;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage:(UIImage * _Nullable )image withCaption:(NSString * _Nullable)caption withCompletion: (PFBooleanResultBlock _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    
////    newPost.likedBy = [NSMutableSet set];
//    [newPost.likedByList initWithEmptySet];
//    NSLog(@"likedByList = %@", newPost.likedByList);
////    [newPost.likedBy addObject:@"mark"];
    
//    [newPost.likedByList init];
    newPost.likedByList = [[NSArray alloc] init];
    
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
    
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

- (void) likePost {
    
    if ([self.likedByList containsObject:(PFUser.currentUser)]) {
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"author != %@", PFUser.currentUser];
        NSArray *newLikeArray = [self.likedByList filteredArrayUsingPredicate:predicate];
//        self removeObjectFor
        self.likedByList = newLikeArray;
        self.likeCount = [NSNumber numberWithInt:[self.likeCount intValue] -1];
    } else {
        NSArray *newLikeArray = [self.likedByList arrayByAddingObject:PFUser.currentUser];
        self.likedByList = newLikeArray;
        //        self.post.likeCount += 1;
        self.likeCount = [NSNumber numberWithInt:[self.likeCount intValue] +1];
    }
    
    [self saveInBackground];
    NSLog(@"SavedInBackground?");
    NSLog(@"like list = %@", self.likedByList);
}

@end
