//
//  FeedModel.m
//  KabNew
//
//  Created by Gabriel Morales on 11/29/15.
//  Copyright © 2015 Gabe Morales. All rights reserved.
//

#import "FeedModel.h"

@implementation FeedModel

+ (FeedModel *)sharedInstance {
    static dispatch_once_t once;
    static FeedModel *instance;
    dispatch_once(&once, ^{
        if (!instance) {
            instance = [[FeedModel alloc] init];
        }
    });
    return instance;
}

#pragma mark - Init
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        _title = dict[@"title"];
        _detail = dict[@"description"];
        _detailDescription = dict[@"detail_description"];
        _cellImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", dict[@"cell_image_url"]]];
        _iPadCellImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", dict[@"ipad_image_url"]]];
        _iPadBackgroundURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", dict[@"ipad_background_image_url"]]];
        _backgroundURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", dict[@"background_image_url"]]];
        _detailBackgroundURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", dict[@"detail_background_image_url"]]];
        _videoURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", dict[@"video_url"]]];
    }
    return self;
}

@end
