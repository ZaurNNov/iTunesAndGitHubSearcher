//
//  iTunesRequest.h
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iTunesRequest : NSObject

+(void) downloadDataFromSearchTerms:(NSString *)searchTerm
                 withCompetionBlock:(void (^)(BOOL success, NSArray *albums)) complete;

+(void) downloadImageFromURL:(NSURL *)url
          withCompetionBlock:(void (^)(BOOL success, UIImage *image)) complete;

@end
