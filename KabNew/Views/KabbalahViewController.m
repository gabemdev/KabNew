//
//  KabbalahViewController.m
//  KabNew
//
//  Created by Rockstar. on 10/31/14.
//  Copyright (c) 2014 Gabe Morales. All rights reserved.
//

#import "KabbalahViewController.h"
#import "CustomCell.h"
#import "KabChannelSchema.h"
#import "KabbalahDetailViewController.h"

@interface KabbalahViewController ()
@property (nonatomic) UITableView *table;
@property (nonatomic, retain) NSArray *channels;
@property (nonatomic, retain) NSMutableDictionary *channelImages;



- (void)getAllChannels;

@end

@implementation KabbalahViewController
@synthesize channels = _channels;

- (instancetype) init {
    if ((self = [super init])) {
        [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Kabbalah"]];
    [self setTableView];
    
    self.channelImages = [NSMutableDictionary dictionary];
    
    NSDictionary *viewDict = @{@"table": _table};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[table]|"
                                                                      options:kNilOptions metrics:nil
                                                                        views:viewDict]];
}

- (void)setTableView {
    _table = [[UITableView alloc] init];
    _table.translatesAutoresizingMaskIntoConstraints = NO;
    _table.backgroundColor = [UIColor lightTextColor];
    _table.delegate = self;
    _table.dataSource = self;
    [_table registerClass:[CustomCell class] forCellReuseIdentifier:@"Cell"];
    _table.scrollEnabled = YES;
    [_table reloadData];
    [self.view addSubview:_table];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:NO];
    [self getAllChannels];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_table reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor lightTextColor];
    
    KabChannelSchema *channel = (self.list)[indexPath.row];
    
    [cell.titleLabel setText:channel.title];
    [cell.subtitleLabel setText:channel.description];
    [cell.cellImageView setImage:[UIImage imageNamed:[channel cellImage]]];
    cell.separatorInset = UIEdgeInsetsMake(0.0, 90.0, 0.0, 0.0);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 120;
    }
    return 90;
}

#pragma mark Receive Wall Objects

-(void)getAllChannels
{
    KabChannelSchema* inner = [[KabChannelSchema alloc]init];
    KabChannelSchema* ask = [[KabChannelSchema alloc]init];
    KabChannelSchema* ideas = [[KabChannelSchema alloc]init];
    KabChannelSchema* kafe = [[KabChannelSchema alloc]init];
    KabChannelSchema* insights = [[KabChannelSchema alloc]init];
    KabChannelSchema* lifestyle = [[KabChannelSchema alloc]init];
    KabChannelSchema* modern = [[KabChannelSchema alloc]init];
    KabChannelSchema* paper = [[KabChannelSchema alloc]init];
    KabChannelSchema* paths = [[KabChannelSchema alloc]init];
    KabChannelSchema* profiles = [[KabChannelSchema alloc]init];
    KabChannelSchema* environment = [[KabChannelSchema alloc]init];
    KabChannelSchema* point = [[KabChannelSchema alloc]init];
    KabChannelSchema* unity = [[KabChannelSchema alloc]init];
    KabChannelSchema* zohar = [[KabChannelSchema alloc]init];
    
    //InnerStream
    inner.title = @"The Inner Stream";
    inner.description = @"The real news of the day from a Kabbalistic perspective.";
    inner.cellImage = @"Inner.png";
    inner.BGTitleImage = @"innerstream.png";
    inner.detailText = @"The Inner Stream is all about the basics of Kabbalah and how it relates to you and the world around you.\n\nThe flow from one daily Kabbalah lesson to the next is the real news of the day and we explore it with talk, music, video clips and live guests.\n\nIt's a live social network featuring you and your questions.\nCall in, write in, drop in and join us as we prepare for the live daily Kabbalah lesson from Israel.";
    inner.url = @"http://tv.kabbalah.info/video/inner-stream";
    inner.view = @"InnerStreamView";
    inner.ipadView = @"InnerIpadDetail";
    
    //Ask the Kabbalist
    ask.title = @"Ask The Kabbalist";
    ask.description = @"Find answers to all your questions from Dr. Laitman.";
    ask.cellImage = @"Ask.png";
    ask.BGTitleImage = @"askthekabbalist.png";
    ask.detailText = @"Find out how Kabbalah answers all questions we have in life, from our personal experiences, through our human society, to the structure and purpose or reality. \n\n\nYou're invited to ask your questions and get them answered on the show by Kabbalist Dr. Michael Laitman.";
    ask.url = @"http://www.tv.kabbalah.info/video/ask-the-kabbalist";
    ask.view = @"AskTheKabbalist";
    ask.ipadView = @"AskIpadDetail";
    
    //20 Ideas
    ideas.title = @"20 Ideas";
    ideas.description = @"In depth talks on a given topic, exploring the Kabbalistic perspective on various subjects.";
    ideas.cellImage = @"Ideas.png";
    ideas.BGTitleImage = @"Ideas_20.png";
    ideas.detailText = @"20 Ideas features Dr. Michael Laitman in conversation with guests from a wide variety of backgrounds and professions on problems they experience in their area of expertise, and in their lives.\n\nDid you ever think that there could be just one cause to all problems in yours and everybody’s lives? By seeing examples of Kabbalah’s ability to unfold any problem, and view the problem inclusively at personal, social and global scales, you get to see how Kabbalah diagnoses any problem’s cause at a single source: the constantly growing ego residing in every person’s nature.\n\nThis kind of analysis takes place time and again in 20 Ideas on the premise that by correctly diagnosing the cause of your problems, you already have half the cure in your hand.\n\n20 Ideas invites you to increase your self-awareness, and your awareness of others and nature, from a vantage point where they all interconnect. Each conversation acts as an example of how, with a deep understanding of nature’s structure and functioning, you can approach all kinds of circumstances in day-to-day life with harmony and balance. By increasing your awareness of how nature operates on you at every moment, you’re already making positive changes for yourself and for others.";
    ideas.url = @"http://www.tv.kabbalah.info/video/20-ideas";
    ideas.view = @"20IdeasVideos";
    ideas.ipadView = @"IdeasIpadDetail";
    
    //Kab Kafe
    kafe.title = @"Kab Kafé";
    kafe.description = @"Unwind at the Kab Kafé where advancing hearts connect with live music in an intimate setting.";
    kafe.cellImage = @"Kafe.png";
    kafe.BGTitleImage = @"kab_kafe_brandnewword_shot3_0.png";
    kafe.detailText = @"KAB Kafé is a warm and alluring coffee house where you’ll travel to a higher level just by entering, and it's not just the music.\n\nFrom honky-tonk blues to painfully beautiful violin solos. Of special note is an a cappella performance that’s like taking a rollercoaster ride into the heavens that leaves you murmuring its refrain. Folk lyrics reveal a new world and tinkling piano keys accent melodies. This is music that enters your ears and is heard in your soul.";
    kafe.url = @"http://tv.kabbalah.info/video/kab-kafé";
    kafe.view = @"KabKafe";
    kafe.ipadView = @"KabKafeIpadDetail";
    
    //Kabbalah Insights
    insights.title = @"Kabbalah Insights";
    insights.description = @"Find the deeper meaning of things from Dr. Michael Laitman as he explains the spiritual root of things from everyday life.";
    insights.cellImage = @"Insights.png";
    insights.BGTitleImage = @"babylon2.png";
    insights.detailText = @"Find the deeper meaning of things from Dr. Michael Laitman as he explains the spiritual root of things from everyday life.";
    insights.url = @"http://tv.kabbalah.info/video/kabbalah-insights";
    insights.view = @"Insights";
    insights.ipadView = @"InsightsIpadDetail";
    
    //Lifestyles
    lifestyle.title = @"Lifestyle";
    lifestyle.description = @"Kabbalistic insights on social issues and personal lifestyles; a guide to expanding perspectives and understanding of familiar issues.";
    lifestyle.cellImage = @"Lifestyles.png";
    lifestyle.BGTitleImage = @"LifestylesView.png";
    lifestyle.detailText = @"By definition, lifestyle is a way of life that reflects the attitudes and values of a person or group. These particular styles of living and thinking are shaped by the influence of our society. And every society offers its ways of dealing with human issues.\n\nSome teachings suggest you pray and ask for help; others suggest you remain calm and simplify life; and others suggest you seek distraction. But can any of them really help you deal with your crumbling relationship, or feelings of loneliness, or your children’s misbehavior at school?\n\nThe Lifestyle series is not about advising what to do in each unique situation; its goal is to explain each situation’s underlying issues, to introduce you to an alternative perspective and approach to familiar subjects.";
    lifestyle.url = @"http://tv.kabbalah.info/video/lifestyle";
    lifestyle.view= @"Lifestyle";
    lifestyle.ipadView = @"LifestyleIpadDetail";
    
    
    //Modern Laws
    modern.title = @"Modern Laws of Global Life";
    modern.description = @"Global society is in crisis because it has yet to discover the laws governing global life. Now is the time to learn them to bring about purposeful, results oriented action.";
    modern.cellImage = @"Modern.png";
    modern.BGTitleImage = @"modernView.png";
    modern.detailText = @"There are laws governing global life just as there are laws governing nature. Humankind has worked mightily to understand nature’s laws in an attempt to control and predict the future. The goal is survival and an enhanced quality of life. The goal is the same when it comes to understanding the laws governing global society. Humanity’s unawareness of these laws has created worldwide crises and is laying the groundwork for new calamities that will keep on coming until people learn how to manage successfully.\n\nModern Laws of Global Life is a series of brief teachings explaining these laws in a concise and impactful format. Want to know the law of success? Then watch the episode to take your first steps in learning how to achieve long-lasting success based on working in balance with nature’s laws. Want to assure positive outcomes? Then learn the law of purpose before you undertake any new task or even formulate a new objective. Refreshingly, you’ll start seeing how there is really only one law upon which success rests. Watch this series to start finding out what that law is, and how to go about discovering it.";
    modern.url = @"http://www.tv.kabbalah.info/video/modern-laws-global-life";
    modern.view = @"ModernView";
    modern.ipadView = @"ModernIpadDetail";
    
    //Paper Clips
    paper.title = @"Paper Clips";
    paper.description = @"Profound concepts presented fun and fast.";
    paper.cellImage = @"Clips.png";
    paper.BGTitleImage = @"ClipsView.png";
    paper.detailText = @"Bring out the whiteboard, it’s time for a lesson! What, no time? Perfect. It’ll just take a moment...\n\nPaper Clips compresses a lesson on a Kabbalah concept into a minute, using drawings, an index finger that points, and a voiceover of a handsome young chap you can’t see...\n\nPaper Clips is where a Kabbalah lesson meets a hot dog stand and a street artist: learning Kabbalah’s concepts through the fast, fun consumption of drawings with running commentary. We could continue talking about this series all day, but by the time it’s taken you to read even this, you could’ve already watched one of the Paper Clips.";
    paper.url = @"http://www.tv.kabbalah.info/video/paper-clips";
    paper.view = @"Clips";
    paper.ipadView = @"PaperClipsIpadDetail";
    
    //Paths
    paths.title = @"Paths";
    paths.description = @"Exploring similarities and differences between Kabbalah and spiritual paths of the world.";
    paths.cellImage = @"Paths.png";
    paths.BGTitleImage = @"PathsView.png";
    paths.detailText = @"What paths lead to the truth? Among the thousands of beliefs, methods and techniques humanity has developed, which ones (or one?) are right for you?\n\nWhen that inner voice for something higher than your day-to-day life starts calling, how do you even begin to know where to start looking, and how deep should you be getting into each teaching and concept you come across?\n\nPaths is for the spiritual seeker, the researcher who’s been through any number of teachings and has now stumbled across Kabbalah. When you start delving into Kabbalah’s concepts, it’s common to connect what you’ve learned in other teachings to what you’re now finding in Kabbalah.\n\nPaths does the job of helping you explore these connections, and the questions that arise from them. In a lively and fun setup, Dr. Michael Laitman is asked all kinds of questions, sitting on the tongue of anyone who’s been searching for something bigger than this world, as well as putting all kinds of common notions of spirituality to the test.";
    paths.url = @"http://www.tv.kabbalah.info/video/paths";
    paths.view = @"Paths";
    paths.ipadView = @"PathsIpadDetail";
    
    //Profiles
    profiles.title = @"Profiles";
    profiles.description = @"Each path is as unique as the person who walks on it.";
    profiles.cellImage = @"Profiles.png";
    profiles.BGTitleImage = @"ProfilesView.png";
    profiles.detailText = @"Each path is as unique as the person who walks on it.\n\nTwo stories illustrate this point: A woman ran away from home, lived a reckless life, and became a political activist later, but the question “Who am I?” was constantly on her mind. One day, she was given a free newspaper “Kabbalah Today”… A man, a gifted photographer, seemed to have tried everything – drugs, alcohol, sex – to understand himself and the purpose of his life.\n\nFeeling his life drifting away, he went searching until he found about Kabbalah.People walk different paths in life to get closer to answers for their existence and purpose in life. They have kept on asking questions in spite of apparent success, achievements and recognition, beyond the passion for their professions, interests and knowledge. But the answers they eventually found brought them only to the very beginning of a life-long journey….The Profiles series is a collection of personal stories aimed at exploring the lives of people who have been searching for both profound, meaningful and practical purpose in their lives.";
    profiles.url = @"http://www.tv.kabbalah.info/video/profiles";
    profiles.view = @"Profiles";
    profiles.ipadView = @"ProfilesIpadDetail";
    
    //Environment
    environment.title = @"Environment Unplugged";
    environment.description = @"Seth Breitman’s songs from the album “The Environment” and insight about what's behind each song.";
    environment.cellImage = @"Environment.png";
    environment.BGTitleImage = @"environmentView.png";
    environment.detailText = @"Songwriter Seth Breitman is one of the millions of people in the world today who have woken up to the need for a completely different life. While the majority of people continue passing through the motions of chasing one transient pleasure after the next - working, raising a family, succeeding in something - there is a growing environment of people who are motivated by deeper questions about life, and who refuse to leave these questions unanswered.\n\nSeth is one of these people. His songs reflect the ups and downs, inspirations and disappointments, of a person who has grown up to question the foundations of an individual, society, the world and life itself, and who discovered a wonderful environment that supports the research, testing and experimentation of those very kinds of questions.\n\nThe Environment is an opening into the depth of Seth’s songs. The series features Seth and fellow musician friends speaking about what inspired each song, and then performing them together.\n\nTitles with \"Music Video\" at the end are the songs themselves, and titles with \"Interview\" at the end are behind the scenes talks with Seth and his friends about the songs.";
    environment.url = @"http://www.tv.kabbalah.info/video/environment-unplugged";
    environment.view = @"Environment";
    environment.ipadView = @"EnvironmentIpadDetail";
    
    //Point
    point.title = @"The Point";
    point.description = @"Personal stories about the search for the meaning of life.";
    point.cellImage = @"Point.png";
    point.BGTitleImage = @"PointView.png";
    point.detailText = @"Everyone wants to be happy, and every person’s search for happiness is expressed in a very unique way.\n\nSome find their happiness in the simplest of pleasures, and others work hard to find happiness through more complex forms of success and self expression. And for some, that point of happiness constantly eludes them. No matter what they try, they can’t seem to find that balance they seek with the world around them. But they search, and search, and search, the whole time looking to make a special contact with an unknown “something,” for something higher than everything this world seems to offer.\n\nThe Point is all about this search. Through personal stories, The Point aims to find that point in every person who seeks happiness beyond the limits of this world, beyond everything people have come to know until today.\n\nThe Point is the story of a person’s innermost search for happiness, and how this search ultimately leads one to start penetrating life’s higher levels.";
    point.url = @"http://www.tv.kabblah.info/video/the-point";
    point.view = @"Point";
    point.ipadView = @"PointIpadDetail";
    
    //Unity
    unity.title = @"Unity Sessions";
    unity.description = @"A group of musicians share a deeply intense experience recording a live pop album together.";
    unity.cellImage = @"Unity.png";
    unity.BGTitleImage = @"UnityView.png";
    unity.detailText = @"In January of 2010, 13 students of the Bnei Baruch Kabbalah Education & Research Institute united in New York City to record a pop album. Over the next 3 days, all held the singular intention of connecting with each other in order to emulate and reveal the living tendency of nature.\n\nUnity Sessions is their process. Join these musicians behind the scenes as they search for a common point of resonance, a point common to all people, and aim to make people feel that point within themselves through the music.\n\nUnity Sessions is an invitation to enter the same common intention, understanding and feeling that the musicians aimed to reach through their time together: one of mutual love and connection among all people.";
    unity.url = @"http://www.tv.kabbalah.info/video/unity-sessions";
    unity.view = @"Unity";
    unity.ipadView = @"UnityIpadDetail";
    
    //Zohar
    zohar.title = @"Unlocking The Zohar";
    zohar.description = @"Short excerpts from the Daily Zohar Lesson with Dr. Michael Laitman.";
    zohar.cellImage = @"Zohar.png";
    zohar.BGTitleImage = @"ZoharView.png";
    zohar.detailText = @"The Zohar is intended not as intellectual, historical, mystical, religious or fictional reading. It rather should be treated less as “a book” and more like “a board,” that by “pressing” on it, that is by inserting one’s effort and will to achieve a better, more complete life through The Zohar, then its signs, letters, and words influence specifically this will in the person in ways that the person cannot understand, but can start feeling.\n\nDeveloping this approach to The Zohar requires developing one’s intention toward it: Why are you reading The Zohar? What do you want to achieve out of it?\n\nDr. Michael Laitman’s commentary in The Zohar lessons helps develop this intention toward The Zohar. Unlocking The Zohar are moments in The Zohar lessons where Dr. Laitman advises on how to aim one’s intention during the study, how to not get confused by The Zohar’s language, which speaks entirely about a higher reality and nothing about this world, and how to stay on track toward finding the deep layers of reality that The Zohar speaks of. Unlocking The Zohar helps you stay connected with and increase this intention from one moment to the next.";
    zohar.url = @"http://www.tv.kabbalah.info/video/unlocking-zohar";
    zohar.view = @"Zohar";
    zohar.ipadView = @"ZoharIpadDetail";
    
    self.list = @[inner, ask, ideas, kafe, insights, lifestyle, modern, paper, paths, profiles, environment, point, unity, zohar];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    KabbalahDetailViewController *detailViewController = [[KabbalahDetailViewController alloc] init];
//    detailViewController.detailTitle = [self.channels valueForKey:@""];
    
    KabbalahDetailViewController *detail = [[KabbalahDetailViewController alloc] init];
    NSIndexPath *index = [_table indexPathForSelectedRow];
    KabChannelSchema *channel = _list[indexPath.row];
    detail.channel = channel;
    
    self.navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self.navigationController setViewControllers:@[detail]];
    [detail setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:detail animated:YES];
    [_table deselectRowAtIndexPath:index animated:YES];
    

    
}

@end
