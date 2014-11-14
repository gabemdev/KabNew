//
//  GMD.h
//  KabNew
//
//  Created by Rockstar. on 11/10/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMD : NSObject

typedef void (^GMDBooleanBlock)(BOOL succeeded, NSError* error);
typedef void (^GMDIntegerBlock)(int number, NSError* error);
typedef void (^GMDArrayBlock)(NSArray* objects, NSError* error);
typedef void (^GMDObjectBlock)(id object, NSError* error);
typedef void (^GMDImageBlock)(UIImage* image, NSError* error);
typedef void (^GMDRequestBlock)(NSData *data,NSURLResponse *response,NSError* error);
typedef void (^GMDBlock)(void);

/**
 * Queues up the given block to be executed on the main thread.
 */
void GMDDispatchOnMain(void (^block)());

/**
 * Queues up the given block to be executed on the CURRENT thread after at least n seconds.
 */
void GMDDispatchAfter(float seconds, void (^block)());

/**
 * Queues up a calculation to run on a background thread.
 */
void GMDDispatchBackground(void (^block)());

@end
