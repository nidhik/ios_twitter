//
//  ComposeTweetViewController.m
//  twitter
//
//  Created by Nidhi Kulkarni on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeTweetViewController.h"
#import "TimelineVC.h"

@interface ComposeTweetViewController ()

@end

@implementation ComposeTweetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"I'm the compose view";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
}

- (void) onCancelButton
{
    TimelineVC *timelineVC = [[TimelineVC alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:timelineVC];
    
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
