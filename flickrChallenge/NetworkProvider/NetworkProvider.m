//
//  NetworkProvider.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "NetworkProvider.h"
#import <UIKit/UIKit.h>
#import "FlickrAPI.h"
#import <UIImageView+WebCache.h>

static NSString *const baseURLString = @"https://api.flickr.com/services/rest";
static NSString *const APIKey = @"939af47c832dd92c423d68dd2c23e54b";

@interface NetworkProvider() <NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation NetworkProvider

+ (void)getDictionaryFromUrl:(NSURL *)url withCompletionBlock:(void (^)(NSDictionary *))completionBlock
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:0
                                                                                      error:nil];
                               completionBlock(json);
                               
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                               });
                               
                           }];
}

+ (void)getRecentPhotosWithCompletionBlock:(void (^)(NSDictionary *))completionBlock
{
    [self getDictionaryFromUrl:[FlickrAPI recentPhotos] withCompletionBlock:completionBlock];
}

+ (void)searchPhotosInPage:(NSNumber *)page withCompletionBlock:(void (^) (NSDictionary *))completionBlock
{
    [self getDictionaryFromUrl:[FlickrAPI searchPhotosInPage:page] withCompletionBlock:completionBlock];
}

+ (void)loadImageWithURL:(NSString *)url withCompletionBlock:(nullable SDInternalCompletionBlock)completedBlock
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager loadImageWithURL:[NSURL URLWithString:url]
                      options:0
                     progress:nil
                    completed:completedBlock];
}

@end
