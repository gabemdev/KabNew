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

- (void)initWithTitle:(NSString *)title withDescription:(NSString *)desc cellImage:(NSString *)cellImage backgroundImage:(NSString *)backgroundImage detailText:(NSString *)detailText url:(NSString *)url view:(NSString *)view iPadView:(NSString *)ipadView {
    self.title = title;
    self.description = desc;
    self.cellImage = cellImage;
    self.BGTitleImage = backgroundImage;
    self.detailText = detailText;
    self.url = url;
    self.view = view;
    self.ipadView = ipadView;
}
@end
