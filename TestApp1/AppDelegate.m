//
//  AppDelegate.m
//  TestApp1
//
//  Created by Zaur Giyasov on 21/05/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "AppDelegate.h"
/*
#import "iTunesRequest.h"
#import "Album.h"
 */

@interface AppDelegate ()

//@property (nonatomic, copy) Album *albums;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // test
    //[self refresh];
    return YES;
}

/*
// test
- (void)refresh {
    [iTunesRequest downloadDataFromSearchTerms:@"Station" withCompetionBlock:^(BOOL success, NSArray *albums) {
        if (success) {
            
            self.albums = albums;
            
            for (Album *album in self.albums) {
                NSLog(@"%@", album.trackName);
            }
        } else {
            NSLog(@"Error");
        }
    }];
}
 */


@end
