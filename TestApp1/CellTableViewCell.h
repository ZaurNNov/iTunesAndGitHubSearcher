//
//  CellTableViewCell.h
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageLogoCell;
@property (weak, nonatomic) IBOutlet UILabel *firstLabelCell;
@property (weak, nonatomic) IBOutlet UILabel *secondLabelCell;

@end
