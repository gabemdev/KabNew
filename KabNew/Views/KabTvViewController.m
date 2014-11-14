//
//  KabTvViewController.m
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "KabTvViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "GMDWebViewController.h"

@interface KabTvViewController ()
@property (nonatomic) UIButton *englishButton, *hebrewButton, *russianButton, *spanishButton, *scheduleButton;
@property (nonatomic) UIImageView *background;
@property (nonatomic, strong) MPMoviePlayerController *mp;
@property (nonatomic) NSArray *menu;

@end

@implementation KabTvViewController
@synthesize collection = _collection;


- (instancetype)init {
    if ((self = [super init])) {
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"KabTV"]];
    
    [self loadCollection];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}


//- (UIButton *)englishButton {
//    if (!_englishButton) {
//        _englishButton = [UIButton languageButton];
////        _englishButton.translatesAutoresizingMaskIntoConstraints = NO;
//        _englishButton.frame = CGRectMake(roundf((self.view.frame.size.width - 300.0f) / 2.0f), 52.0f, 300.0f, 42.0f);
//        [_englishButton setTitle:@"  ENGLISH"forState:UIControlStateNormal];
//        [_englishButton setImage:[UIImage imageNamed:@"icn_trending_tv_default"] forState:UIControlStateNormal];
//        [_englishButton setImage:[UIImage imageNamed:@"icn_trending_tv_default_white"] forState:UIControlStateHighlighted];
////        [_englishButton addTarget:self action:@selector(playEnglish:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_englishButton];
//    }
//    return _englishButton;
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:NO];
    _englishButton.alpha = 1.0f;
}

- (void)loadCollection {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.menu = [[NSArray alloc] initWithObjects:
                 @"ENGLISH",
                 @"עברית",
                 @"PYCCKий",
                 @"ESPAÑOL",
                 @"SCHEDULE",nil];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(140.0f, 140.0f);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 8.0;
    layout.minimumLineSpacing = 9.0;
    layout.sectionInset = UIEdgeInsetsMake(9, 13, 13, 13);
    [self.collection setCollectionViewLayout:layout];
    
    _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height - 60) collectionViewLayout:layout];
    _collection.backgroundColor = [UIColor kabStaticColor];
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.translatesAutoresizingMaskIntoConstraints = NO;
    [_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    _collection.pagingEnabled = YES;
    [_collection reloadData];
    
    [self.view addSubview:_collection];
    
    NSDictionary *viewDict = @{@"collection": _collection};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[collection]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[collection]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
}

#pragma mark - UiCollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.menu count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
    cell.layer.cornerRadius = 3;
    UILabel *titleLabel = (UILabel *)[[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0.0f, 49.0f, 140.0f, 42.0f);
    titleLabel.textColor = [UIColor kabBlueColor];
    titleLabel.shadowColor = [UIColor whiteColor];
    titleLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    [titleLabel setText:self.menu[indexPath.row]];
    [cell addSubview:titleLabel];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSString *urlText = [NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-eng-mobile.stream/playlist.m3u8"];
        NSURL *url = [NSURL URLWithString:urlText];
        
        [self loadVideoPlayerplayURL:url];
        
        
    } else if (indexPath.row == 1) {
        NSString *urlText = [NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-heb-mobile.stream/playlist.m3u8"];
        NSURL *url = [NSURL URLWithString:urlText];
        
        [self loadVideoPlayerplayURL:url];
        
    } else if (indexPath.row == 2) {
        NSString *urlText = [NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-rus-mobile.stream/playlist.m3u8"];
        NSURL *url = [NSURL URLWithString:urlText];
        
        [self loadVideoPlayerplayURL:url];
        
    } else if (indexPath.row == 3) {
        NSString *urlText = [NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-spa-mobile.stream/playlist.m3u8"];
        NSURL *url = [NSURL URLWithString:urlText];
        
        [self loadVideoPlayerplayURL:url];
        
    } else if (indexPath.row == 4) {
        GMDWebViewController *viewController = [[GMDWebViewController alloc] init];
        [viewController loadURL:[NSURL URLWithString:@"http://m.kab.tv/ios/Schedule.html"]];
        [viewController.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        [self.tabBarController.tabBar setHidden:YES];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark - Media

- (void)loadVideoPlayerplayURL:(NSURL *)url {
    MPMoviePlayerViewController *media = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [media.moviePlayer setAllowsAirPlay:YES];
    [[media view] setFrame:[self.view bounds]];
    [media.moviePlayer prepareToPlay];
    [media.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self presentMoviePlayerViewControllerAnimated:media];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackStateChange:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:[media moviePlayer]];
    
    
    
}

- (void)moviePlayBackStateChange:(NSNotification *)notification
{
    MPMoviePlayerController *player = notification.object;
    //are we currently playing?
    if (player.playbackState == MPMoviePlaybackStatePlaying)
    { //yes->do something as we are playing...
    }
    else if (player.playbackState == MPMoviePlaybackStateStopped)
    { //nope->do something else since we are not playing
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops"
                                                                       message:@"Feed is not available at this time"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"OK Button");
        }];
        [alert addAction:okButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - Sharing
- (void)share:(id)sender {
    
}


@end
