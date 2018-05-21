//
//  iTunesViewController.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "iTunesViewController.h"
#import "CellTableViewCell.h"
#import "iTunesRequest.h"
#import "Album.h"


@interface iTunesViewController () <UISearchDisplayDelegate, UISearchBarDelegate , UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
//@property (weak, nonatomic) IBOutlet CellTableViewCell *resultCell;

@property (nonatomic, copy) NSArray *albums;
@property (nonatomic) UILabel *error;
@property (nonatomic) NSArray *searchResults;
@property (nonatomic) NSTimer *timer;

@property (nonatomic) NSString *searchLetter;

@end

@implementation iTunesViewController

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
    
    self.searchLetter = @"keynote";
    
    [iTunesRequest downloadDataFromSearchTerms:self.searchLetter withCompetionBlock:^(BOOL success, NSArray *albums) {
        
        if (success) {
            self.albums = albums;
            [self loadForAlbums];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"Error refresh:  %@", NSStringFromSelector(_cmd));
        }
    }];
}
     
- (void)loadForAlbums {
    
    for (int i = 0; i < self.albums.count; i++) {
        
        Album *album = self.albums[i];
        NSLog(@"%@", album.trackName);
        
        [album getImageWithCompletionBlock:^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSIndexPath *ip = [NSIndexPath indexPathForItem:i inSection:0];
                CellTableViewCell *cell = (CellTableViewCell *)[self.tableView cellForRowAtIndexPath:ip];
                cell.imageView.alpha = 1;
                [self.tableView reloadData];
            });
        }];
    }
}

#pragma mark - UITableViewData
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.albums count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell";
    CellTableViewCell *cell = (CellTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
//    if () {
        // Hack prepare for search
        
//        Album *album = [self.searchResults objectAtIndex:indexPath.row];
//        cell.albumNameLabel.text = album.albumName;
//        cell.artistLabel.text = album.artistName;
//        cell.trackName.text = album.trackName;
//        cell.albumImageView.image = album.image;
        
//    } else {
        Album *album = [self.albums objectAtIndex:indexPath.row];
        cell.albumNameLabel.text = album.albumName;
        cell.artistLabel.text = album.artistName;
        cell.trackName.text = album.trackName;
        cell.albumImageView.image = album.image;
//    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100.f;
}

#pragma mark - Search
// not ready


//#pragma mark - Seque
////iTunesDetail
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    static sequeID
//    if (segue.identifier isEqualToString:@"iTunesDetail") {
//        <#statements#>
//    }
//}


@end
