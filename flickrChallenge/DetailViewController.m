//
//  DetailViewController.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "DetailViewController.h"
#import "NetworkProvider.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UISwitch *toggle;
@property (strong, nonatomic) Photo* photo;

@end

@implementation DetailViewController

- (instancetype)initWithPhoto:(Photo *)photo
{
    self = [super init];
    if (self) {
        self.photo = photo;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _photo.title;
    self.toggle.on = _photo.enabled;
    
    [NetworkProvider loadImageWithURL:_photo.urlImage withCompletionBlock:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.picture.image = image;
    }];
}



@end
