//
//  iTunesRequest.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "iTunesRequest.h"
#import "iTunesJSONParser.h"


@implementation iTunesRequest

static NSString *iTunesURL = @"http://itunes.apple.com/search?term=%@&limit=200&country=ru&entity=musicTrack";

//+(void) downloadDataFromSearchTerms:(NSString *)searchTerm entity:(NSString *) entityName
//                 withCompetionBlock:(void (^)(BOOL success, NSArray *albums))complete {
//
//}

+(void) downloadDataFromSearchTerms:(NSString *)searchTerm
                 withCompetionBlock:(void (^)(BOOL success, NSArray *albums))complete {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:iTunesURL,
                                                                               [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"+"]]]
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                         timeoutInterval:24 *60];
    
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    // nslog data
                    complete((error == nil), [iTunesJSONParser parseAlbumsFromData:data]);
                    
                }] resume];
}

+(void) downloadImageFromURL:(NSURL *)url
          withCompetionBlock:(void (^)(BOOL success, UIImage *image))complete {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                         timeoutInterval:24 *60];
    
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    
                    // nslog data
                    UIImage *image = [UIImage imageWithData:data];
                    
                    complete((error == nil), image);
                    
                }] resume];
}

@end
