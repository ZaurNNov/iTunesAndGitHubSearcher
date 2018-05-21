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
    
    self.headShotImageView.image = self.headshotImage;
    self.trackNameLabel.text = [self.trackName copy];
    self.albumNameLabel.text = [self.albumName copy];
    self.artistNameLabel.text = [self.artistName copy];
    self.priceNameLabel.text = [self.priceName copy];
    self.releaseDateLabel.text = [self.releaseDate copy];
}

@end
