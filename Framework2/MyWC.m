//
//  MyWC.m
//  Framework2
//
//  Created by Jim Jin [STAFF] on 3/14/17.
//  Copyright © 2017 Jim Jin [STAFF]. All rights reserved.
//

#import "MyWC.h"


@interface MyWC ()


@end

@implementation MyWC

- (void)windowDidLoad
{
    [super windowDidLoad];
    NSString *authority = @"https://login.microsoftonline.com/common";
    NSString *resourceURI = @"https://api.office.com/discovery";
    NSString *clientID = @"d3590ed6-52b3-4102-aeff-aad2292ab01c";
    NSString *redirectURI = @"urn:ietf:wg:oauth:2.0:oob";
    
    ADAuthenticationError *error;
    ADAuthenticationContext *authContext = [[ADAuthenticationContext alloc] initWithAuthority:authority validateAuthority:YES error:&error];
    NSURL *redirectUri = [[NSURL alloc]initWithString:resourceURI];
    
    [authContext acquireTokenWithResource:authority
                                 clientId:clientID
                              redirectUri:redirectUri
                          completionBlock:^(ADAuthenticationResult *result) {
        if (result.tokenCacheItem == nil)
        {
            return;
        }
        else
        {
            NSDictionary *payload = @{
                                      @"access_token" : result.tokenCacheItem.accessToken
                                      };
        }
    }];
}
@end
