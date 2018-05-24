//
//  Album.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "Album.h"

@implementation Album

- (instancetype)initWithAlbumName:(NSString *)albumName
                       artistName:(NSString *)artistName
                        trackName:(NSString *)trackName
                         imageURL:(NSString *)imageURL
                      priceString:(NSString *)priceString
                releaseDateString:(NSString *)releaseDateString {
    
    self = [super init];
    
    if (self) {
        _albumName = [albumName copy];
        _artistName = [artistName copy];
        _trackName = [trackName copy];
        _imageURL = [imageURL copy];
        _priceString = [priceString copy];
        _releaseDateString = [releaseDateString copy];
    }
    
    return self;
}

+ (UIImage *)imageFromImage:(UIImage *)image scaled:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)getImageWithCompletionBlock:(void (^)(void))completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;
    
    [[session dataTaskWithURL:[NSURL URLWithString:self.imageURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                __strong typeof(self) strongSelf = weakSelf;
                
                UIImage *image = [UIImage imageWithData:data];
                
                [Album imageFromImage:image scaled:CGSizeMake(200, 200)];
                
                strongSelf.image = image;
                
                completionBlock();
                
            }] resume];
}

@end
