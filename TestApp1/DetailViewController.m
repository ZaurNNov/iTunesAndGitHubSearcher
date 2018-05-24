//
//  DetailViewController.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

 @property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
 @property (weak, nonatomic) IBOutlet UILabel *nameOrLoginLabel;
 @property (weak, nonatomic) IBOutlet UILabel *albumOrUrlLabel;
 @property (weak, nonatomic) IBOutlet UILabel *artistOrRepoUrlLabel;
 @property (weak, nonatomic) IBOutlet UILabel *priceOrScoreLabel;
 @property (weak, nonatomic) IBOutlet UILabel *releaseOrIDLabel;


@end

@implementation DetailViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    if (self.navigationController) {
        self.navigationController.navigationBarHidden = NO;
    }

    Album *iTunesAlbum = self.albumShared;
    User *gitHubUser = self.userShared;
    
    if (iTunesAlbum) {
        self.logoImageView.image = iTunesAlbum.image;
        self.nameOrLoginLabel.text = iTunesAlbum.trackName;
        self.albumOrUrlLabel.text = iTunesAlbum.albumName;
        self.artistOrRepoUrlLabel.text = iTunesAlbum.artistName;
        self.priceOrScoreLabel.text = iTunesAlbum.priceString;
        self.releaseOrIDLabel.text = [self releaseDateFormattedString:iTunesAlbum];
        
        self.title = iTunesAlbum.trackName;
        
    } else if (gitHubUser) {
        self.logoImageView.image = gitHubUser.imageAvatar;
        self.nameOrLoginLabel.text = gitHubUser.login;
        self.albumOrUrlLabel.text = gitHubUser.urlString;
        self.artistOrRepoUrlLabel.text = gitHubUser.repos_url;
        self.priceOrScoreLabel.text = [NSString stringWithFormat:@"ID: %@", gitHubUser.idNumber];
        self.releaseOrIDLabel.text = [NSString stringWithFormat:@"SCORE: %@", gitHubUser.score];
        
        self.title = gitHubUser.login;
    }
}

-(NSString *)releaseDateFormattedString:(Album *)releaseAlbumStr {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-dd-MM'T'HH:mm:ss'Z'";
    NSDate *utc = [df dateFromString:releaseAlbumStr.releaseDateString];
    df.timeZone = [NSTimeZone systemTimeZone];
    
    [df setDateFormat:@"dd/MM/yyyy"];
    NSString *local = [df stringFromDate:utc];
    return local;
}

-(IBAction)dissmissWindow:(id)sender {
    //
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
