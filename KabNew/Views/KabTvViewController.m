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

@interface KabTvViewController () <UICollectionViewDelegateFlowLayout>
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
                 @"ITALIANO",
                 @"SCHEDULE",nil];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    

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
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = CGSizeMake(185, 185);
    return itemSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 1.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    CGFloat left = self.collection.frame.size.width / 2 - 155;
    NSLog(@"%f", left);
    
//    return UIEdgeInsetsMake(20, left, 15, left);
    return UIEdgeInsetsMake(1, 2, 1, 2);
}



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
    titleLabel.frame = CGRectMake(0.0f, cell.frame.size.height / 2 - 20, 185.0f, 42.0f);
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
    
    switch (indexPath.row) {
        case 0: [self loadVideoPlayerplayURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-eng-mobile.stream/playlist.m3u8"]]]; break;
        case 1: [self loadVideoPlayerplayURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-heb-mobile.stream/playlist.m3u8"]]]; break;
        case 2: [self loadVideoPlayerplayURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-rus-mobile.stream/playlist.m3u8"]]]; break;
        case 3: [self loadVideoPlayerplayURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://edge1.nl.kab.tv/rtplive/live1-spa-mobile.stream/playlist.m3u8"]]]; break;
        case 5: [self loadWebView]; break;
        default: [self loadAlertWithTitle:@"Alert" andMessage:@"Language still not supported"]; break;
    }
}

- (void)loadWebView {
    GMDWebViewController *viewController = [[GMDWebViewController alloc] init];
    [viewController loadURL:[NSURL URLWithString:@"http://m.kab.tv/ios/Schedule.html"]];
    [viewController.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)loadAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackStateChange:) name:MPMoviePlayerPlaybackDidFinishNotification object:[media moviePlayer]];
    
    
    
}

- (void)moviePlayBackStateChange:(NSNotification *)notification
{
    MPMoviePlayerController *player = notification.object;
    switch (player.playbackState) {
        case MPMoviePlaybackStatePlaying: NSLog(@"Normal Playing"); break;
        case MPMoviePlaybackStatePaused: NSLog(@"Paused playing"); break;
        case MPMoviePlaybackStateStopped: NSLog(@"Stopped"); break;
        case MPMoviePlaybackStateInterrupted: [self loadAlertWithTitle:@"Alert" andMessage:@"Feed is not available at this time, please try again later."]; break;
        default: break;
    }
    
    switch (player.loadState) {
        case MPMovieLoadStatePlayable: NSLog(@"Playable"); break;
        case MPMovieLoadStateStalled: NSLog(@"Stalled"); break;
        case MPMovieLoadStatePlaythroughOK: NSLog(@"Playtrhough ok "); break;
        case MPMovieLoadStateUnknown: NSLog(@"Unknown"); break;
        default: break;
    }
    
    
    NSDictionary *notificationUserInfo = [notification userInfo];
    NSNumber *resultValue = [notificationUserInfo objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    MPMovieFinishReason reason = [resultValue intValue];
    NSError *mpError = [notificationUserInfo objectForKey:@"error"];
    switch (reason) {
        case MPMovieFinishReasonPlaybackEnded: NSLog(@"Ended"); break;
        case MPMovieFinishReasonPlaybackError: NSLog(@"Error:"); [self loadAlertWithTitle:@"Alert" andMessage:mpError.localizedDescription]; break;
        case MPMovieFinishReasonUserExited: NSLog(@"User exited"); break;
        default: break;
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}

#pragma mark - Sharing
- (void)share:(id)sender {
    
}


@end
