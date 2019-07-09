//
//  LoggedInViewController.h
//  myInstagram
//
//  Created by michaelvargas on 7/8/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoggedInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *timelineTableView;

@property (strong, nonatomic) NSArray *postArray;
- (IBAction)didTapLogout:(id)sender;


@end

NS_ASSUME_NONNULL_END
