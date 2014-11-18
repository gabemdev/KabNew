//
//  KabChannelSchema.m
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "KabChannelSchema.h"

@implementation KabChannelSchema
@synthesize description;

- (instancetype)initWithDetailView:(NSString *)plistName {
    if ((self = [super init])) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
        self.tableTitleArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
        self.titleCount = [self.tableTitleArray count];
    }
    return self;
}
@end
