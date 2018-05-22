//
//  GitHubJSONParser.h
//  TestApp1
//
//  Created by Zaur Giyasov on 22/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GitHubJSONParser : NSObject

+ (NSArray *)parseUserFromData:(NSData *)data;

@end
