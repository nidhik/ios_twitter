//
//  TweetCell.m
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface TweetCell()

    @property (weak, nonatomic) IBOutlet UIImageView *profileImage;
    @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
    @property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
    @property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
    @property (weak, nonatomic) IBOutlet UILabel *tweetText;

@end

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) updateUIElementsWithTweet: (Tweet *) tweet {
    self.tweet = tweet;
    self.tweetText.text = tweet.text;
    self.nameLabel.text = tweet.name;
    self.userNameLabel.text = tweet.screenName;
    self.timestampLabel.text = tweet.timeDiff;
    [self.profileImage setImageWithURL:tweet.profileImageURL];
   
}

@end
