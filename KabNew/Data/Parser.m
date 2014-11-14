//
//  Parser.m
//  KabNew
//
//  Created by Rockstar. on 11/1/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "Parser.h"

@implementation Parser

@synthesize items, responseData, currentTitle, currentDate, currentSummary, currentLink, currentThr, currentCategory, currentGuid;

- (void)parseRssFeed:(NSString *)url withDelegate:(id)aDelegate {
    [self setDelegate:aDelegate];
    
    responseData = [NSMutableData data];
    NSURL *baseURL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:baseURL];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSString *errorString = [NSString stringWithFormat:@"No internet connection detected. Please check your Internet connection and try again"];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:errorString
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.items = [[NSMutableArray alloc] init];
    NSXMLParser *rssParser = [[NSXMLParser alloc] initWithData:responseData];
    [rssParser setDelegate:self];
    [rssParser parse];
}

#pragma mark - RSSParser Methods
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    currentElement = [elementName copy];
    
    if ([elementName isEqualToString:@"item"]) {
        item = [[NSMutableDictionary alloc] init];
        self.currentTitle = [[NSMutableString alloc] init];
        self.currentDate = [[NSMutableString alloc] init];
        self.currentSummary = [[NSMutableString alloc] init];
        self.currentLink = [[NSMutableString alloc] init];
        self.currentThr = [[NSMutableString alloc] init];
        self.currentCategory = [[NSMutableString alloc] init];
        self.currentGuid = [[NSMutableString alloc] init];
        
    }
    
        if ([currentElement isEqualToString:@"enclosure"]) {

        }
        
        if ([currentElement isEqualToString:@"thr:total"]) {
            
        }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:self.currentTitle forKey:@"title"];
        [item setObject:self.currentLink forKey:@"link"];
        [item setObject:self.currentSummary forKey:@"summary"];
        [item setObject:self.currentThr forKey:@"thr:total"];
        [item setObject:self.currentCategory forKey:@"itunes:keywords"];
        [item setObject:self.currentGuid forKey:@"feedburner:origLink"];
        
        //Date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"E, d LLL yyyy HH:mm:ss zzz"];
        NSDate *date = [dateFormatter dateFromString:self.currentDate];
        
        if (!date) {
            date = [NSDate date];
        }
        
        [item setObject:date forKey:@"date"];
        [items addObject:[item copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([currentElement isEqualToString:@"title"]) {
        [self.currentTitle appendString:string];
    } else if ([currentElement isEqualToString:@"link"]) {
        [self.currentLink appendString:string];
    } else if ([currentElement isEqualToString:@"content:encoded"]) {
        [self.currentSummary appendString:string];
    } else if ([currentElement isEqualToString:@"pubDate"]) {
        [self.currentDate appendString:string];
        NSCharacterSet* charsToTrim = [NSCharacterSet characterSetWithCharactersInString:@" \n"];
        [self.currentDate setString: [self.currentDate stringByTrimmingCharactersInSet: charsToTrim]];
    } else if ([currentElement isEqualToString:@"thr:total"]){
        [self.currentThr appendString:string];
    } else if ([currentElement isEqualToString:@"itunes:keywords"]){
        [self.currentCategory appendString:string];
    } else if ([currentElement isEqualToString:@"link"]){
        [self.currentGuid appendString:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    if ([_delegate respondsToSelector:@selector(receivedItems:)]) {
        [_delegate receivedItems:items];
    } else {
        [NSException raise:NSInternalInconsistencyException format:@"Delegate doesn't respond to receivedItems:"];
    }
}

#pragma mark - Delegate
- (id)delegate {
    return _delegate;
}

- (void)setDelegate:(id)new_delegate {
    _delegate = new_delegate;
}
@end
