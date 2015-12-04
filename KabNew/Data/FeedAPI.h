//
//  FeedAPI.h
//  KabNew
//
//  Created by Gabriel Morales on 11/29/15.
//  Copyright © 2015 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedAPI : NSObject
typedef void(^CompletionBlock)(BOOL success, NSData * response, NSError * error );

+ (FeedAPI *)sharedInstance;
@property (nonatomic, strong) AFHTTPRequestSerializer *requestSerializer;
- (void)requestFeedWithUrl:(NSString *)url withCompletion:(CompletionBlock)comp;
@end
