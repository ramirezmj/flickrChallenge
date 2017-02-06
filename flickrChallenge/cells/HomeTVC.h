//
//  HomeTVC.h
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitchButtonProtocol.h"

@interface HomeTVC : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UISwitch *toggle;
@property (weak, nonatomic) id <SwitchButtonProtocol> delegate;

+ (UINib *)nib;

@end
