//
//  User.h
//  TestApp1
//
//  Created by Zaur Giyasov on 22/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property (nonatomic, readonly, copy) NSString *login;
@property (nonatomic, readonly, copy) NSString *avatar_url;
@property (nonatomic, readonly, copy) NSString *organizations_url;
@property (nonatomic, readonly, copy) NSString *repos_url;
@property (nonatomic, readonly, copy) NSString *urlString;
@property (nonatomic, readonly, copy) NSNumber *idNumber;
@property (nonatomic, readonly, copy) NSNumber *score;

@property (nonatomic) UIImage *imageAvatar;

- (instancetype)initWithUserLogin:(NSString *)login
                        avatar_ur:(NSString *)avatar_ur
                organizations_url:(NSString *)organizations_url
                        repos_url:(NSString *)repos_url
                        urlString:(NSString *)urlString
                         idNumber:(NSNumber *)idNumber
                            score:(NSNumber *)score;

- (void)getImageWithCompletionBlock:(void (^)(void))completionBlock;

@end
