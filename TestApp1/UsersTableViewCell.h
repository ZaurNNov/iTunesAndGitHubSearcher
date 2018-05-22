//
//  UsersTableViewCell.h
//  TestApp1
//
//  Created by Zaur Giyasov on 22/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *login;
@property (weak, nonatomic) IBOutlet UILabel *loginId;
@property (weak, nonatomic) IBOutlet UILabel *loginScore;

@end
