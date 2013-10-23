//
//  User.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const UserDidLoginNotification;
extern NSString *const UserDidLogoutNotification;

@interface User : RestObject

+ (User *)currentUser;
+ (void)setCurrentUser:(User *)currentUser;

@property (nonatomic, retain, readonly) NSString *screenName;
@property (nonatomic, retain, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSURL *profileImageURL;

@end
