//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)name {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}

- (NSString *)screenName {
    NSString *_sn = [self.data valueOrNilForKeyPath:@"user.screen_name"];
    if (_sn) {
        return [NSString stringWithFormat:@"@%@ ", _sn ];
    }
    return _sn;
}

- (NSURL *)profileImageURL {
    NSString *url = [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
    return [[NSURL alloc] initWithString:url];
}

- (int)statusId {
    NSString *idStr = [self.data valueOrNilForKeyPath:@"id"];
    
    if (idStr) {
        return [idStr intValue];
    }
    return 0; //don't have one
}


- (NSDate *)createdDate {
    NSString *date = [self.data valueOrNilForKeyPath:@"created_at"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    NSLog(@"%@", [formatter dateFromString:date]);
    return [formatter dateFromString:date];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
