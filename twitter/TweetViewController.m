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
