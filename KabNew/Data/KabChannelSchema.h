//
//  KabChannelSchema.h
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface KabChannelSchema : NSObject
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong, readwrite) NSString * description;
@property (nonatomic, strong) NSString * cellImage;
@property (nonatomic, strong) NSString * BGTitleImage;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * view;
@property (nonatomic, strong) NSString * detailText;
@property (nonatomic, strong) NSString * ipadView;

@property (nonatomic, assign) NSInteger titleCount;
@property (nonatomic, strong) NSMutableArray *tableTitleArray;


- (instancetype) initWithDetailView:(NSString *)plistName NS_DESIGNATED_INITIALIZER;
- (void)initWithTitle:(NSString *)title
      withDescription:(NSString *)desc
            cellImage:(NSString *)cellImage
      backgroundImage:(NSString *)backgroundImage
           detailText:(NSString *)detailText
                  url:(NSString *)url
                 view:(NSString *)view
             iPadView:(NSString *)ipadView;
@end
