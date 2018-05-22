//
//  GitHubViewController.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "GitHubViewController.h"
#import "UsersTableViewCell.h"
#import "GitHubRequest.h"
#import "User.h"
#import "UserDetailsViewController.h"


@interface GitHubViewController () <UISearchControllerDelegate , UISearchBarDelegate , UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, copy) NSArray *users;
@property (nonatomic) NSString *searchLetter;

- (IBAction)reloadButtonAction:(UIBarButtonItem *)sender;

@end

@implementation GitHubViewController

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self refresh];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self refresh];
    }
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"GitHub Search";
    self.tableView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Refresh

- (void)refresh {
    
    if (!self.searchLetter) {
        self.searchLetter = @"";
    }

    [GitHubRequest downloadDataFromSearchTerms:self.searchLetter withCompetionBlock:^(BOOL success, NSArray *users) {

        if (success) {
            self.users = users;
            [self loadForAlbums];

            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
                //NSLog(@"Error refresh:  %@", NSStringFromSelector(_cmd));
                // alert
            [[[UIAlertView alloc] initWithTitle:@"Error"
                                        message:@"Error bla bla bla..."
                                       delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles:nil, nil] show];
        }
    }];
}

- (void)loadForAlbums {
    
    for (int i = 0; i < self.users.count; i++) {

        User *user = self.users[i];
        NSLog(@"%@", user.login);

        [user getImageWithCompletionBlock:^{

            dispatch_async(dispatch_get_main_queue(), ^{
                NSIndexPath *ip = [NSIndexPath indexPathForItem:i inSection:0];
                UsersTableViewCell *cell = (UsersTableViewCell *)[self.tableView cellForRowAtIndexPath:ip];
                cell.imageView.alpha = 1;
                [self.tableView reloadData];
            });
        }];
    }
}

- (IBAction)reloadButtonAction:(UIBarButtonItem *)sender {
    [self refresh];
}


#pragma mark - UITableViewData
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.users count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell";
    UsersTableViewCell *cell = (UsersTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UsersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    User *user = [self.users objectAtIndex:indexPath.row];
    cell.login.text = user.login;
    cell.loginId.text = [NSString stringWithFormat:@"Login ID: %@", user.idNumber];
    cell.loginScore.text = [NSString stringWithFormat:@"User score: %@", user.score];
    cell.avatarImageView.image = user.imageAvatar;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100.f;
}

#pragma mark - Search

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (!searchBar.text) {
        return;
    } else {
        NSLog(@"%@", searchBar.text);
        self.searchLetter = searchBar.text;
        [self.tableView endEditing:YES];
        [self refresh];
    }
}


#pragma mark - Seque

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier  isEqual: @"GitHubDetail"]) {
        NSLog(@"%@", NSStringFromSelector(_cmd));
        
            //UINavigationController *nc = [segue destinationViewController];
            //DetailViewController *dvc = nc.viewControllers[0];
        
        UserDetailsViewController *udvc = [segue destinationViewController];
        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
        User *userShared = self.users[ip.item];
        udvc.userShared = userShared;
    }
}



@end

