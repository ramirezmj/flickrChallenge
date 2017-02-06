//
//  ModelProvider.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "ModelProvider.h"
#import "Photo.h"

static NSString *const key_photos = @"photo";

@implementation ModelProvider

+ (NSArray *)getPhotosFromDictionary:(NSDictionary *)jsonDictionary
{
    NSMutableArray *photosMutableArray = @[].mutableCopy;
    
    for (NSDictionary *photoDict in jsonDictionary[key_photos]) {
        Photo *photoItem = [Photo getPhotoFromDictionary:photoDict];
        if (photoItem) {
            [photosMutableArray addObject:photoItem];
        }
    }
    
    return [NSArray arrayWithArray:photosMutableArray];
}

@end
