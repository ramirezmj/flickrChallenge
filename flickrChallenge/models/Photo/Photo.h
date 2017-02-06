//
//  Photo.h
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, copy) NSString *urlThumbnail;
@property (nonatomic, copy) NSString *urlImage;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL enabled;

+ (Photo *)getPhotoFromDictionary:(NSDictionary *)dictionary;

@end
