//
//  HomeTVC+ConfigureForPhoto.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "HomeTVC+ConfigureForPhoto.h"
#import "NetworkProvider.h"
#import "Photo.h"

@implementation HomeTVC (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo
{
    self.picture.image = nil;
    self.toggle.on = NO;
    
    [NetworkProvider loadImageWithURL:photo.urlThumbnail withCompletionBlock:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.picture.image = image;
    }];
    
    self.toggle.on = photo.enabled;
}

- (IBAction)didClickSwitchToogle:(UISwitch *)sender
{
    [self.delegate returnToggledCell:self sender:sender];
}

@end
