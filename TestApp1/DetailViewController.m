//
//  DetailViewController.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()


 @property (weak, nonatomic) IBOutlet UIImageView *headShotImageView;
 @property (weak, nonatomic) IBOutlet UILabel *trackNameLabel;
 @property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
 @property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
 @property (weak, nonatomic) IBOutlet UILabel *priceNameLabel;
 @property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
 

@end

@implementation DetailViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    if (self.navigationController) {
        self.navigationController.navigationBarHidden = NO;
    }
    
    Album *al = self.albumShared;
    if (al) {
        self.headShotImageView.image = al.image;
        self.trackNameLabel.text = al.trackName;
        self.albumNameLabel.text = al.albumName;
        self.artistNameLabel.text = al.artistName;
        self.priceNameLabel.text = al.priceString;
        self.releaseDateLabel.text = [self releaseDateFormattedString:al];
        
        self.title = al.trackName;
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
