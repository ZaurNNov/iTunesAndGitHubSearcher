//
//  UserDetailsViewController.m
//  TestApp1
//
//  Created by A1 on 22.05.2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "UserDetailsViewController.h"

@interface UserDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *loginAvatarImage;
@property (weak, nonatomic) IBOutlet UILabel *loginNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userUrlLabel;
@property (weak, nonatomic) IBOutlet UILabel *reposUrlLabel;
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *userScoreLabel;

@end

@implementation UserDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    if (self.navigationController) {
        self.navigationController.navigationBarHidden = NO;
    }
    
    User *gitHubUser = self.userShared;
    if (gitHubUser) {
        self.loginAvatarImage.image = gitHubUser.imageAvatar;
        self.loginNameLabel.text = gitHubUser.login;
        self.userUrlLabel.text = gitHubUser.urlString;
        self.reposUrlLabel.text = gitHubUser.repos_url;
        self.userIDLabel.text = [NSString stringWithFormat:@"ID: %@", gitHubUser.idNumber];
        self.userScoreLabel.text = [NSString stringWithFormat:@"SCORE: %@", gitHubUser.score];
        
        self.title = gitHubUser.login;
    }
    
}

-(IBAction)dissmissWindow:(id)sender {
        //
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end

