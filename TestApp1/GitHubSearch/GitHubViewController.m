//
//  GitHubViewController.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "GitHubViewController.h"
#import "CellTableViewCell.h"
#import "iTunesRequest.h"
#import "Album.h"
#import "DetailViewController.h"

@interface GitHubViewController () <UISearchControllerDelegate , UISearchBarDelegate , UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSString *searchLetter;

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
    
//    if (!self.searchLetter) {
//        self.searchLetter = @"";
//    }
//
//    [iTunesRequest downloadDataFromSearchTerms:self.searchLetter withCompetionBlock:^(BOOL success, NSArray *albums) {
//
//        if (success) {
//            self.albums = albums;
//            [self loadForAlbums];
//
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.tableView reloadData];
//            });
//        } else {
//                //NSLog(@"Error refresh:  %@", NSStringFromSelector(_cmd));
//                // alert
//            [[[UIAlertView alloc] initWithTitle:@"Error"
//                                        message:@"Error bla bla bla..."
//                                       delegate:nil
//                              cancelButtonTitle:@"Close"
//                              otherButtonTitles:nil, nil] show];
//
//        }
//    }];
}

- (void)loadForAlbums {
    
//    for (int i = 0; i < self.albums.count; i++) {
//
//        Album *album = self.albums[i];
//        NSLog(@"%@", album.trackName);
//
//        [album getImageWithCompletionBlock:^{
//
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSIndexPath *ip = [NSIndexPath indexPathForItem:i inSection:0];
//                CellTableViewCell *cell = (CellTableViewCell *)[self.tableView cellForRowAtIndexPath:ip];
//                cell.imageView.alpha = 1;
//                [self.tableView reloadData];
//            });
//        }];
//    }
}

- (IBAction)reloadButtonAction:(UIBarButtonItem *)sender {
    [self refresh];
}


#pragma mark - UITableViewData
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
    //return [self.albums count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell";
    CellTableViewCell *cell = (CellTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
//    Album *album = [self.albums objectAtIndex:indexPath.row];
//    cell.albumNameLabel.text = album.albumName;
//    cell.artistLabel.text = album.artistName;
//    cell.trackName.text = album.trackName;
//    cell.albumImageView.image = album.image;
    
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
//        [self refresh];
    }
}


#pragma mark - Seque

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    if ([segue.identifier  isEqual: @"iTunesDetail"]) {
//        NSLog(@"%@", NSStringFromSelector(_cmd));
//
//            //UINavigationController *nc = [segue destinationViewController];
//            //DetailViewController *dvc = nc.viewControllers[0];
//
//        DetailViewController *dvc = [segue destinationViewController];
//        NSIndexPath *ip = [self.tableView indexPathForCell:sender];
//        Album *albumShare = self.albums[ip.item];
//        dvc.albumShared = albumShare;
//    }
}



@end

