//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell

@property (nonatomic, retain) Tweet *tweet;

- (void) updateUIElementsWithTweet: (Tweet *) tweet;


@end
