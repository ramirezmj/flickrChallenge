//
//  NetworkProvider.h
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIImageView+WebCache.h>

@interface NetworkProvider : NSObject

+ (void)getRecentPhotosWithCompletionBlock:(void (^)(NSDictionary *))completionBlock;
+ (void)searchPhotosInPage:(NSNumber *)page withCompletionBlock:(void (^) (NSDictionary *))completionBlock;
+ (void)loadImageWithURL:(NSString *)url withCompletionBlock:(nullable SDInternalCompletionBlock)completedBlock;

@end
