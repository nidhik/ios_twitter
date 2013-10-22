//
//  TweetViewController.h
//  twitter
//
//  Created by Nidhi Kulkarni on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetViewController : UIViewController

@property (nonatomic, retain) Tweet *tweet;

- (id) initWithTweet:(Tweet *) tweet;

@end
