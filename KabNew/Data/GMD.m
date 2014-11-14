//
//  GMD.m
//  KabNew
//
//  Created by Rockstar. on 11/10/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "GMD.h"

@implementation GMD

- (id)init
{
    [super doesNotRecognizeSelector:_cmd];
    return nil;
}

void GMDDispatchOnMain(void (^block)()) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void GMDDispatchAfter(float seconds, void (^block)()) {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(),block);
}

void GMDDispatchBackground(void (^block)()) {
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    dispatch_async(queue,block);
}

- (id)viewControllerWithStoryboardIdentifier:(NSString *)identifier
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end
