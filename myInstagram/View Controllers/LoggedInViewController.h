//
//  LoggedInViewController.h
//  myInstagram
//
//  Created by michaelvargas on 7/8/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteScrollActivityView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoggedInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *timelineTableView;
@property (strong, nonatomic) NSArray *postArray;
@property (assign, nonatomic) BOOL isMoreDataLoading;

@property (strong, nonatomic) InfiniteScrollActivityView* loadingMoreView;


- (IBAction)didTapLogout:(id)sender;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
