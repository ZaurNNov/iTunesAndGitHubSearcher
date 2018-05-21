//
//  Album.h
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Album : NSObject

@property (nonatomic, readonly, copy) NSString *albumName;
@property (nonatomic, readonly, copy) NSString *artistName;
@property (nonatomic, readonly, copy) NSString *trackName;
@property (nonatomic, readonly, copy) NSString *imageURL;
@property (nonatomic, readonly, copy) NSString *priceString;
@property (nonatomic, readonly, copy) NSString *releaseDateString;

@property (nonatomic) UIImage *image;

- (instancetype)initWithAlbumName:(NSString *)albumName
                       artistName:(NSString *)artistName
                        trackName:(NSString *)trackName
                         imageURL:(NSString *)imageURL
                      priceString:(NSString *)priceString
                releaseDateString:(NSString *)releaseDateString;

- (void)getImageWithCompletionBlock:(void (^)(void))completionBlock;

@end
