//
//  MyTableViewController.m
//  TestApp1
//
//  Created by Zaur Giyasov on 24/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"
#import "Album.h"
#import "User.h"

@interface MyTableViewController ()

@property (nonatomic, copy) NSArray *albums;
@property (nonatomic, copy) NSArray *users;


@end

@implementation MyTableViewController


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
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
    
    
    MyTableViewCell *cell = (MyTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:currentCellId forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:currentCellId];
    }
    
    // SegmentControl
    if (self) {
        Album *album = [self.albums objectAtIndex:indexPath.row];
        cell.albumNameLabel.text = album.albumName;
        cell.artistLabel.text = album.artistName;
        cell.trackName.text = album.trackName;
        cell.albumImageView.image = album.image;
    } else {
        User *user = [self.users objectAtIndex:indexPath.row];
        cell.login.text = user.login;
        cell.loginId.text = [NSString stringWithFormat:@"Login ID: %@", user.idNumber];
        cell.loginScore.text = [NSString stringWithFormat:@"User score: %@", user.score];
        cell.avatarImageView.image = user.imageAvatar;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
