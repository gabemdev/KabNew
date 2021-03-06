//
//  BBEmptyDataSetSource.h
//  KabNew
//
//  Created by Gabriel Morales on 12/21/15.
//  Copyright © 2015 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+EmptyDataSet.h"

@interface BBEmptyDataSetSource : NSObject <DZNEmptyDataSetSource>

+ (instancetype)emptyDataSetSourceWithTitle:(NSString *)title
                                description:(NSString *)description;

@end
