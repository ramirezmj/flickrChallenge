//
//  HomeTVC+ConfigureForPhoto.h
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "HomeTVC.h"


@class Photo;

@interface HomeTVC (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo;

@end
