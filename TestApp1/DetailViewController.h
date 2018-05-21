//
//  DetailViewController.h
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, copy) NSString *trackName;
@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *priceName;
@property (nonatomic, copy) NSString *releaseDate;
@property (nonatomic, copy) UIImage *headshotImage;

@end
