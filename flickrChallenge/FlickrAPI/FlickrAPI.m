//
//  FlickrAPI.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "FlickrAPI.h"

static NSString *const baseURLString      = @"https://api.flickr.com/services/rest";
static NSString *const APIKey             = @"939af47c832dd92c423d68dd2c23e54b";
static NSString *const key_method         = @"method";
static NSString *const key_format         = @"format";
static NSString *const key_nojsoncallback = @"nojsoncallback";
static NSString *const key_api_key        = @"api_key";
static NSString *const key_extras         = @"extras";
static NSString *const key_text           = @"text";
static NSString *const key_per_page       = @"per_page";
static NSString *const key_page           = @"page";

@implementation FlickrAPI

+ (NSURL *)flickrURLForMethod:(NSString *)method withParameters:(NSDictionary *)additionalParameters
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURLString];
    NSMutableArray *queryItems = [[NSMutableArray alloc] init];
    NSDictionary *baseParams = @{ key_method : method,
                                  key_format : @"json",
                                  key_nojsoncallback : @"1",
                                  key_api_key : APIKey
                                  };
    
    [baseParams enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        NSURLQueryItem * item = [[NSURLQueryItem alloc] initWithName:key value:obj];
        [queryItems addObject:item];
    }];
    
    if (additionalParameters) {
        [additionalParameters enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
            NSURLQueryItem * item = [[NSURLQueryItem alloc] initWithName:key value:obj];
            [queryItems addObject:item];
        }];
    }
    
    components.queryItems = queryItems;
    return components.URL;
}

+ (NSURL *)recentPhotos
{
    NSDictionary *additionalParameters = @{key_extras : @"url_h,date_taken"};
    NSURL *url = [self flickrURLForMethod:@"flickr.photos.getRecent" withParameters:additionalParameters];
    
    return url;
}

+ (NSURL *)searchPhotosInPage:(NSNumber *)page
{
    NSDictionary *additionalParameters = @{key_text : @"Barcelona",
                                           key_extras: @"url_t, url_m",
                                           key_per_page: @"20",
                                           key_page: [page stringValue]};
    NSURL *url = [self flickrURLForMethod:@"flickr.photos.search" withParameters:additionalParameters];
    
    return url;
}

@end
