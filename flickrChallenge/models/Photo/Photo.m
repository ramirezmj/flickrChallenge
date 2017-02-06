//
//  Photo.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "Photo.h"

static NSString *const key_url_t = @"url_t";
static NSString *const key_url_m = @"url_m";
static NSString *const key_title = @"title";
static NSString *const key_id    = @"id";

@implementation Photo

+ (Photo *)getPhotoFromDictionary:(NSDictionary *)dictionary
{
    Photo *photoItem = [[Photo alloc] init];
    if(![self isEmptyString:dictionary[key_url_t]]) {
        photoItem.urlThumbnail = dictionary[key_url_t];
    }
    
    if(![self isEmptyString:dictionary[key_url_m]]) {
        photoItem.urlImage = dictionary[key_url_m];
    }
    
    if(![self isEmptyString:dictionary[key_title]]) {
        photoItem.title = dictionary[key_title];
    }
    
    if (dictionary[key_id]) {
        photoItem.identifier = dictionary[key_id];
    }
    
    
    photoItem.enabled = NO;
    
    return photoItem;
}

/*!
 * @discussion Returns YES if the string is nil or equal to @""
 */
+ (BOOL)isEmptyString:(NSString *)string
{
    if ([string isKindOfClass:[NSString class]]) {
        // Note that [string length] == 0 can be false when [string isEqualToString:@""] is true, because these are Unicode strings.
        if (((NSNull *) string == [NSNull null]) || (string == nil) ) {
            return YES;
        }
        string = [string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([string isEqualToString:@""]) {
            return YES;
        }
        return NO;
    }
    return YES;
}

@end
