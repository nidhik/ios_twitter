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

- (NSString *)statusId {
    return [self.data valueOrNilForKeyPath:@"id"];
}


- (NSString *)createdDate {
    // http://stackoverflow.com/questions/902950/iphone-convert-date-string-to-a-relative-time-stamp/6509076#6509076
    
    NSString *date = [self.data valueOrNilForKeyPath:@"created_at"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat: @"EEE MMM dd HH:mm:ss Z yyyy"];
    
    NSDate *ret = [dateFormatter dateFromString:date];
    
    NSDate *todayDate = [NSDate date];
    double ti = [ret timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
    	return @"never";
    } else 	if (ti < 60) {
    	return @"just now";
    } else if (ti < 3600) {
    	int diff = round(ti / 60);
    	return [NSString stringWithFormat:@"%dm", diff];
    } else if (ti < 86400) {
    	int diff = round(ti / 60 / 60);
    	return[NSString stringWithFormat:@"%dh", diff];
    } else if (ti < 2629743) {
    	int diff = round(ti / 60 / 60 / 24);
    	return[NSString stringWithFormat:@"%dd", diff];
    } else {
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        return [dateFormatter stringFromDate:[NSDate date]];
    }
    return 0;
}

- (bool) retweeted {
    NSString *val = [self.data valueOrNilForKeyPath:@"retweeted"];
    return [val intValue];
}

- (bool) favorited {
    NSString *val = [self.data valueOrNilForKeyPath:@"favorited"];
    return [val intValue];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
