//
//  TweetViewController.m
//  twitter
//
//  Created by Nidhi Kulkarni on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "ComposeTweetViewController.h"

@interface TweetViewController ()

// these three keep showing up, this needs to be its own nib I can reuse
// haven't figured that out yet
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reply;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *retweet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favorite;

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

	// Do any additional setup after loading the view.
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
