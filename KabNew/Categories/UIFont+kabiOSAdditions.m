//
//  UIFont+kabiOSAdditions.m
//  KabNew
//
//  Created by Rockstar. on 11/6/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "UIFont+kabiOSAdditions.h"

NSString *const kBBFontRegularKey = @"Regular";
NSString *const kBBFontItalicKey = @"Italic";
NSString *const kBBFontBoldKey = @"Bold";
NSString *const kBBFontBoldItalicKey = @"BoldItalic";
NSString *const kCDIFontHelveticaNeueKey = @"HelveticaNeue";
NSString *const kBBRegularFontName = @"HelveticaNeue";
NSString *const kBBBoldFontName = @"HelveticaNeue-Bold";

@implementation UIFont (kabiOSAdditions)

#pragma mark - Font Name
+ (NSDictionary *)kabFontMapForFontKey:(NSString *)key {
    static NSDictionary *fontDictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fontDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"HelveticaNeue", kBBFontRegularKey,
                           @"HelveticaNeue-Italic", kBBFontItalicKey,
                           @"HelveticaNeue-Bold", kBBFontBoldKey,
                           @"HelveticaNeue-BoldItalic", kBBFontBoldItalicKey,
                           nil], kCDIFontHelveticaNeueKey,
                          nil];
    });
    return [fontDictionary objectForKey:key];
}

+ (NSString *)kabFontNameForFontKey:(NSString *)key style:(NSString *)style {
    return [[self kabFontMapForFontKey:key] objectForKey:style];
}

#pragma mark - Fonts

+ (UIFont *)kabFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
    NSString *fontName = [self kabFontNameForFontKey:key style:kBBFontRegularKey];
    return [self fontWithName:fontName size:fontSize];
}

+ (UIFont *)boldKabFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
    NSString *fontName = [self kabFontNameForFontKey:key style:kBBFontBoldKey];
    return [self fontWithName:fontName size:fontSize];
}

+ (UIFont *)boldItalicKabFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
    NSString *fontName = [self kabFontNameForFontKey:key style:kBBFontBoldItalicKey];
    return [self fontWithName:fontName size:fontSize];
}

+ (UIFont *)italicKabFontOfSize:(CGFloat)fontSize fontKey:(NSString *)key {
    NSString *fontName = [self kabFontNameForFontKey:key style:kBBFontItalicKey];
    return [self fontWithName:fontName size:fontSize];
}

#pragma mark - Interface

+ (UIFont *)kabInterfaceFontOfSize:(CGFloat)fontSize {
    return [self fontWithName:kBBRegularFontName size:fontSize];
}

+ (UIFont *)boldKabInterfaceFontOfSize:(CGFloat)fontSize {
    return [self fontWithName:kBBBoldFontName size:fontSize];
}

@end
