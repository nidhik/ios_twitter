//
//  ComposeTweetViewController.m
//  twitter
//
//  Created by Nidhi Kulkarni on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeTweetViewController.h"
#import "TimelineVC.h"
#import "UIImageView+AFNetworking.h"

@interface ComposeTweetViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetComposeView;

@property (retain, nonatomic) NSString *initialText;
@property (assign, nonatomic) int replyId;

@end

@implementation ComposeTweetViewController

- (id)initWithStartTweetTextAndOptionalReplyStatusId:(NSString *)startTweetText optionalReplyStatusId:(int) replyStatusId {
    self = [super initWithNibName:@"ComposeTweetView" bundle:nil];
    if (self) {
        self.initialText = startTweetText;
        self.replyId = replyStatusId ? replyStatusId : 0;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTweetButton)];
    User *_currentUser = [User currentUser];
    
    self.nameLabel.text = _currentUser.name;
    self.screenNameLabel.text = _currentUser.screenName;
    [self.profileImage setImageWithURL:_currentUser.profileImageURL];
    
    if (self.initialText) {
        self.tweetComposeView.text = self.initialText;
    }
    
    [self.tweetComposeView becomeFirstResponder];
    
    // would be nice to have a disabled Tweet button to start. enabled when there are 0 < n < 141 characters
}

- (void) onCancelButton
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ComposeModalDismissed"
                                                        object:nil
                                                      userInfo:nil];
    [self.navigationController dismissViewControllerAnimated:YES completion:^(void){}];
}

- (void) onTweetButton
{
    NSString *text = self.tweetComposeView.text;
    if (self.tweetComposeView.text.length > 140) {
        // gross, a hack until have time to constrain user input once 140 char limit is reached
        text = [self.tweetComposeView.text substringWithRange:NSMakeRange(0, 141)];
    }
    
    [[TwitterClient instance] tweet:text inReplyToStatusId:self.replyId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        [self onCancelButton];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [self onCancelButton];
    }];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
