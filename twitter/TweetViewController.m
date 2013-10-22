//
//  TweetViewController.m
//  twitter
//
//  Created by Nidhi Kulkarni on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"

@interface TweetViewController ()

@end

@implementation TweetViewController

- (id) initWithTweet:(Tweet *) tweet {
    self = [super initWithNibName:@"TweetView" bundle:nil];
    if (self) {
        self.title = @"I'm the tweet view";
        self.tweet = tweet;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
