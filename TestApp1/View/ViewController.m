//
//  ViewController.m
//  TestApp1
//
//  Created by Zaur Giyasov on 24/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "Album.h"
#import "User.h"
#import "iTunesRequest.h"
#import "GitHubRequest.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate , UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UISearchBar *search;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, copy) NSArray *result;
@property (nonatomic, copy) NSArray *albums;
@property (nonatomic, copy) NSArray *users;
@property (nonatomic) NSString *searchLetter;

@end

@implementation ViewController

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

#pragma mark - Refresh

- (void)refresh {
    
    if (!self.searchLetter) {
        self.searchLetter = @"";
    }
    
    //segment
    // self.segment.selectedSegmentIndex == 1
    if (self.segment.selectedSegmentIndex == 0) {
        
            // iTunes search
            
            [iTunesRequest downloadDataFromSearchTerms:self.searchLetter withCompetionBlock:^(BOOL success, NSArray *albums) {
                
                if (success) {
                    self.albums = albums;
                    self.result = self.albums;
                    [self loadForiTunesAlbums];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.myTableView reloadData];
                    });
                } else {
                    NSLog(@"Error refresh:  %@", NSStringFromSelector(_cmd));
                }
            }];
        
    } else if (self.segment.selectedSegmentIndex == 1) {
        
        // GitHub search
            
            [GitHubRequest downloadDataFromSearchTerms:self.searchLetter withCompetionBlock:^(BOOL success, NSArray *users) {
                
                if (success) {
                    self.users = users;
                    self.result = self.users;
                    [self loadForGitHubAlbums];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.myTableView reloadData];
                    });
                } else {
                    NSLog(@"Error refresh:  %@", NSStringFromSelector(_cmd));
                }
            }];
    }
}


- (void)loadForiTunesAlbums {
    
    for (int i = 0; i < self.result.count; i++) {
        
        Album *album = self.albums[i];
        NSLog(@"%@", album.trackName);
        
        // iTunes image
        [album getImageWithCompletionBlock:^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSIndexPath *ip = [NSIndexPath indexPathForItem:i inSection:0];
                MyTableViewCell *cell = (MyTableViewCell *)[self.myTableView cellForRowAtIndexPath:ip];
                cell.imageView.alpha = 1;
                [self.myTableView reloadData];
            });
        }];
    }
}

- (void)loadForGitHubAlbums {
    
    for (int i = 0; i < self.result.count; i++) {

        User *user = self.users[i];
        NSLog(@"%@", user.login);
        
        // GitHub image
        [user getImageWithCompletionBlock:^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSIndexPath *ip = [NSIndexPath indexPathForItem:i inSection:0];
                MyTableViewCell *cell = (MyTableViewCell *)[self.myTableView cellForRowAtIndexPath:ip];
                cell.imageView.alpha = 1;
                [self.myTableView reloadData];
            });
        }];
    }
}

- (IBAction)reloadButtonAction:(UIBarButtonItem *)sender {
    [self refresh];
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search";
    self.myTableView.backgroundColor = [UIColor whiteColor];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.result count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell1";
    static NSString *cellID2 = @"Cell2";
    
    NSString *currentCellId = nil;
    
    if (!(indexPath.row % 2)) {
        currentCellId = cellID2;
    } else {
        currentCellId = cellID;
    }
    
    MyTableViewCell *cell = (MyTableViewCell *)[self.myTableView dequeueReusableCellWithIdentifier:currentCellId forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:currentCellId];
    }
    
    // SegmentControl
    if (self) {
        Album *album = [self.albums objectAtIndex:indexPath.row];
        cell.nameLabel.text = album.albumName;
        cell.detailLabel.text = album.artistName;
        cell.subDetailLabel.text = album.trackName;
        cell.loginImageView.image = album.image;
    } else {
        User *user = [self.users objectAtIndex:indexPath.row];
        cell.nameLabel.text = user.login;
        cell.detailLabel.text = [NSString stringWithFormat:@"Login ID: %@", user.idNumber];
        cell.subDetailLabel.text = [NSString stringWithFormat:@"User score: %@", user.score];
        cell.loginImageView.image = user.imageAvatar;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.f;
}

// Hide keyboard
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.search resignFirstResponder];
    [self.view endEditing:YES];
}


#pragma mark - Search

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (!searchBar.text) {
        return;
    } else {
        NSLog(@"%@", searchBar.text);
        self.searchLetter = searchBar.text;
        [self.view endEditing:YES];
        [self refresh];
    }
}

// Clear searchBar;
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    searchBar.text = @"";
    return YES;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    self.searchLetter = searchBar.text;
}

//-(void)setSegment:(UISegmentedControl *)segment {
//
//}
//
//-(UISegmentedControl *)segment {
//
//}

@end


