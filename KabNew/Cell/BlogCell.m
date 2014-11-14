//
//  BlogCell.m
//  KabNew
//
//  Created by Rockstar. on 11/2/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "BlogCell.h"

@implementation BlogCell
@synthesize titleLabel = _titleLabel;
@synthesize subtitleLabel = _subtitleLabel;
@synthesize cellImageView = _cellImageView;
@synthesize placeholder  = _placeholder;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier])) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.subtitleLabel];
        [self addSubview:self.cellImageView];
        
        
        NSDictionary *viewDict = @{@"titleLabel": _titleLabel,
                                   @"subtitleLabel": _subtitleLabel,
                                   @"cellImage": _cellImageView};
        
        //Title
        NSArray *title_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-90-[titleLabel]|"
                                                                   options:0 metrics:nil
                                                                     views:viewDict];
        
        NSArray *title_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[titleLabel(45)]"
                                                                   options:0 metrics:nil
                                                                     views:viewDict];
        
        //Subtitle
        NSArray *subtitle_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-90-[subtitleLabel]-|"
                                                                      options:0 metrics:nil
                                                                        views:viewDict];
        NSArray *subtitle_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[subtitleLabel(20)]"
                                                                      options:0 metrics:nil
                                                                        views:viewDict];
        
        //Cell Image
        NSArray *image_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-6-[cellImage(80)]"
                                                                   options:0 metrics:nil
                                                                     views:viewDict];
        
        NSArray *image_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[cellImage(65)]"
                                                                   options:0 metrics:nil
                                                                     views:viewDict];
        
        [self addConstraints:title_H];
        [self addConstraints:title_V];
        [self addConstraints:subtitle_H];
        [self addConstraints:subtitle_V];
        [self addConstraints:image_H];
        [self addConstraints:image_V];
    }
    return self;
}

#pragma mark - UIControls
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 8.0f, 215.0f, 45.0f)];
        _titleLabel.textColor = [UIColor kabBlueColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
    }
    return _titleLabel;
    
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(90.0f, 60.0f, 215.0f, 20.0f)];
        _subtitleLabel.textColor = [UIColor lightGrayColor];
        _subtitleLabel.font = [UIFont systemFontOfSize:12.0f];
        _subtitleLabel.textAlignment = NSTextAlignmentRight;
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _subtitleLabel;
}


- (UIImageView *)cellImageView {
    if (!_cellImageView) {
        _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(6.0f, 8.0f, 80.0f, 65.0f)];
        _cellImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"placeholder"]];
        _cellImageView.contentMode = UIViewContentModeScaleToFill;
        _cellImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _cellImageView;
}

@end
