//
//  User.m
//  TestApp1
//
//  Created by Zaur Giyasov on 22/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithUserLogin:(NSString *)login
                       avatar_ur:(NSString *)avatar_ur
               organizations_url:(NSString *)organizations_url
                       repos_url:(NSString *)repos_url
                       urlString:(NSString *)urlString
                        idNumber:(NSNumber *)idNumber
                           score:(NSNumber *)score {
    self = [super init];
    
    if (self) {
        _login = [login copy];
        _avatar_url = [avatar_ur copy];
        _organizations_url = [organizations_url copy];
        _repos_url = [repos_url copy];
        _urlString = [urlString copy];
        _idNumber = [idNumber copy];
        _score = [score copy];
    }
    
    return self;
}

+ (UIImage *)imageFromImage: (UIImage *)image scaled:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)getImageWithCompletionBlock:(void (^)(void))completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;
    
    [[session dataTaskWithURL:[NSURL URLWithString:self.avatar_url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                __strong typeof(self) strongSelf = weakSelf;
                
                UIImage *image = [UIImage imageWithData:data];
                
                [User imageFromImage:image scaled:CGSizeMake(200, 200)];
                
                strongSelf.imageAvatar = image;
                
                completionBlock();
                
            }] resume];
}

@end
