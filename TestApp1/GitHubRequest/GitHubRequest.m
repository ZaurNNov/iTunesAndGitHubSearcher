//
//  GitHubRequest.m
//  TestApp1
//
//  Created by Zaur Giyasov on 22/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "GitHubRequest.h"

@implementation GitHubRequest

static NSString *gitLink = @"https://api.github.com/search/users?q=%@";

+(void) downloadDataFromSearchTerms:(NSString *)searchTerm
                 withCompetionBlock:(void (^)(BOOL success, NSArray *albums))complete {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:gitLink,
                                                                               [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"+"]]]
                                             cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                         timeoutInterval:24 *60];
    
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                        // nslog data
                    //complete((error == nil), [iTunesJSONParser parseAlbumsFromData:data]);
                    
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
