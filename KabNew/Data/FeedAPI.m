//
//  FeedAPI.m
//  KabNew
//
//  Created by Gabriel Morales on 11/29/15.
//  Copyright © 2015 Gabe Morales. All rights reserved.
//

#import "FeedAPI.h"

@implementation FeedAPI

+ (FeedAPI *)sharedInstance {
    static dispatch_once_t once;
    static FeedAPI *instance;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[FeedAPI alloc] init];
        }
    });
    return instance;
}

- (void)requestFeedWithUrl:(NSString *)url withCompletion:(CompletionBlock)comp {
    NSString *request = url;
    [self getRequest:request parameters:nil completion:^(BOOL success, NSData *response, NSError *error) {
        comp(success, response, error);
    }];
    
}

- (void)getRequest:(NSString *)requestPath parameters:(NSDictionary *)parameters completion:(CompletionBlock)completion {
    NSURL *url = [NSURL URLWithString:requestPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    op.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain"]];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion != nil) completion(TRUE, responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure!");
        [self handleError:error];
    }];
    [op start];
}

#pragma mark - Network
- (void)handleError:(NSError *)error{
    // display user friendly error
    
    if(![AFNetworkReachabilityManager sharedManager].reachable){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please make sure you are connecting to a network." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Something went wrong , Please try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
    }
    NSString * message = error.localizedDescription;
    // send error to the server or use some bug tracking tool.
    NSLog(@"Error = %@",message);
    
}
@end
