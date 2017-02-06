//
//  SwitchButtonProtocol.h
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeTVC;
@protocol SwitchButtonProtocol <NSObject>

@required
- (void)returnToggledCell:(HomeTVC *)cell sender:(UISwitch *)toggle;

@end
