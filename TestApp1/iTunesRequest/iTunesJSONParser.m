//
//  iTunesJSONParser.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "iTunesJSONParser.h"
#import "Album.h"

@implementation iTunesJSONParser

+ (NSArray *)parseAlbumsFromData:(NSData *)data {
    
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    
    id json = [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingAllowFragments
                                                         error:nil];
    
    for (id jsonElement in json[@"results"]) {
        
        NSString *artistName = jsonElement[@"artistName"];
        NSString *albumName = jsonElement[@"collectionName"];
        NSString *photoURL = jsonElement[@"artworkUrl100"];
        NSString *trackName = jsonElement[@"trackName"];
        NSString *priceString = [NSString stringWithFormat:@"%@ %@", jsonElement[@"collectionPrice"], jsonElement[@"currency"]];
        NSString *releaseDateString = jsonElement[@"releaseDate"];
        
        Album *album = [[Album alloc] initWithAlbumName:albumName
                                                 artistName:artistName
                                                  trackName:trackName
                                                   imageURL:photoURL
                                                priceString:priceString
                                          releaseDateString:releaseDateString];
        
        [albums addObject:album];
    }
    
    return albums;
}

@end
