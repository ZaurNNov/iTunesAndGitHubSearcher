//
//  iTunesJSONParser.h
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iTunesJSONParser : NSObject

+ (NSArray *)parseAlbumsFromData:(NSData *)data;

@end
