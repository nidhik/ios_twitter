//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject

@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *screenName;
@property (nonatomic, strong, readonly) NSString *createdDate;
@property (nonatomic, strong, readonly) NSString *timeDiff;
@property (nonatomic, strong, readonly) NSURL *profileImageURL;
@property (nonatomic, assign, readonly) bool retweeted;
@property (nonatomic, assign, readonly) bool favorited;

@property (nonatomic, assign, readonly) NSString *statusId;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
