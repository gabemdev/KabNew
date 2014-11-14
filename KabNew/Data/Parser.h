//
//  Parser.h
//  KabNew
//
//  Created by Rockstar. on 11/1/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ParserDelegate <NSObject>
- (void)receivedItems:(NSArray *)theItems;

@end

@interface Parser : NSObject<NSXMLParserDelegate> {
    id _delegate;
    
    NSMutableData *responseData;
    NSMutableArray *items;
    NSMutableDictionary *item;
    NSString *currentElement;
    NSMutableString *currentTitle, *currentDate, *currentSummary, *currentLink, *currentCategory;
    NSMutableString *currentThr, *currentGuid;
}

@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSMutableString *currentTitle, *currentDate, *currentSummary, *currentLink, *currentThr;
@property (nonatomic, retain) NSMutableString *currentCategory, *currentGuid;

- (void)parseRssFeed:(NSString *)url withDelegate: (id)aDelegate;

- (id)delegate;
- (void)setDelegate:(id)new_delegate;
@end
