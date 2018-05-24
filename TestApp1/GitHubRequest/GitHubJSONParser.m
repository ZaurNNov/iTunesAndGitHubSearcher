//
//  GitHubJSONParser.m
//  TestApp1
//
//  Created by Zaur Giyasov on 22/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "GitHubJSONParser.h"
#import "User.h"

@implementation GitHubJSONParser

+ (NSArray *)parseUserFromData:(NSData *)data {
    
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    id json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingAllowFragments
                                                error:nil];
    
    for (id jsonElement in json[@"items"]) {

        NSString *login = jsonElement[@"login"];
        NSString *avatar_url = jsonElement[@"avatar_url"];
        NSString *organizations_url = jsonElement[@"organizations_url"];
        NSString *repos_url = jsonElement[@"repos_url"];
        NSString *urlString = jsonElement[@"url"];
        NSNumber *idNumber = jsonElement[@"id"];
        NSNumber *score = jsonElement[@"score"];
        
        User *user = [[User alloc]initWithUserLogin:login
                                           avatar_ur:avatar_url
                                   organizations_url:organizations_url
                                           repos_url:repos_url
                                           urlString:urlString
                                            idNumber:idNumber
                                               score:score];
        
        [users addObject:user];
    }
    
    return users;
}

@end
