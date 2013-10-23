//
//  TweetViewController.m
//  twitter
//
//  Created by Nidhi Kulkarni on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "ComposeTweetViewController.h"
#import "UIImageView+AFNetworking.h"

@interface TweetViewController ()

// these three keep showing up, this needs to be its own nib so I can reuse
// haven't figured that out yet
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reply;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *retweet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favorite;
@property (weak, nonatomic) IBOutlet UILabel *tweetDateLabel;

@end

@implementation TweetViewController

- (id) initWithTweet:(Tweet *) tweet {
    self = [super initWithNibName:@"TweetView" bundle:nil];
    if (self) {
        self.title = @"Tweet";
        self.tweet = tweet;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Compose" style:UIBarButtonItemStylePlain target:self action:@selector(onComposeButton)];

    self.nameLabel.text = self.tweet.name;
    self.screenNameLabel.text = self.tweet.screenName;
    [self.profileImage setImageWithURL:self.tweet.profileImageURL];
    self.tweetTextLabel.text = self.tweet.text;
    
    [self.reply setTarget:self];
    [self.reply setAction:@selector(onReply)];
    
    [self.retweet setTarget:self];
    [self.retweet setAction:@selector(onRetweet)];
    if (self.tweet.retweeted) {
        self.retweet.tintColor = [UIColor greenColor];
    }
    
    [self.favorite setTarget:self];
    [self.favorite setAction:@selector(onFav)];
    if (self.tweet.favorited) {
        self.favorite.tintColor = [UIColor greenColor];
    }
    
    self.tweetDateLabel.text = self.tweet.createdDate;

	// Do any additional setup after loading the view.
}

- (void) onReply {
    ComposeTweetViewController *vc = [[ComposeTweetViewController alloc] initWithStartTweetTextAndOptionalReplyStatusId:self.tweet.screenName optionalReplyStatusId:self.tweet.statusId];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];    
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void) onRetweet {
    [[TwitterClient instance] retweet:self.tweet.statusId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.retweet.tintColor = [UIColor greenColor];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        self.retweet.tintColor = [UIColor redColor];
    }];
}
- (void) onFav {
    [[TwitterClient instance] favorite:self.tweet.statusId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.favorite.tintColor = [UIColor greenColor];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        self.favorite.tintColor = [UIColor redColor];
    }];
}

- (void) onComposeButton
{
    ComposeTweetViewController *vc = [[ComposeTweetViewController alloc] initWithNibName:@"ComposeTweetView" bundle:nil];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
