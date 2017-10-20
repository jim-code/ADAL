//
//  AppDelegate.m
//  Framework2
//
//  Created by Jim Jin [STAFF] on 3/14/17.
//  Copyright © 2017 Jim Jin [STAFF]. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSString *authority = @"https://login.microsoftonline.com/common";
    NSString *resourceURI = @"https://api.office.com/discovery";
    NSString *clientID = @"d3590ed6-52b3-4102-aeff-aad2292ab01c";
    NSString *redirectURI = @"urn:ietf:wg:oauth:2.0:oob";
    
    ADAuthenticationError *error = nil;
    ADAuthenticationContext *authContext = [[ADAuthenticationContext alloc] initWithAuthority:authority validateAuthority:YES error:&error];
    NSURL *redirectUri = [[NSURL alloc]initWithString:redirectURI];
    
    [authContext acquireTokenWithResource:resourceURI
                                 clientId:clientID
                              redirectUri:redirectUri
                           promptBehavior:AD_PROMPT_ALWAYS
                                   userId:@"jjin@isb.bj.edu.cn"
                     extraQueryParameters:nil
                          completionBlock:^(ADAuthenticationResult *result) {
        if (result.tokenCacheItem == nil)
        {
            NSLog(@"0000000000");
            return;
        }
        else
        {
            NSLog(@"1111111111@", result.tokenCacheItem.accessToken);
            NSDictionary *payload = @{
                                      @"access_token" : result.tokenCacheItem.accessToken
                                      };
            NSLog(@"2222222222%@,%@,%@", result.description,result.status,payload);
        }
    }];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
