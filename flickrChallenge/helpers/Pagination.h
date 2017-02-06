//
//  Pagination.h
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pagination : NSObject

@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger itemsPerPage;
@property (nonatomic, assign) NSInteger maximumPages;

- (instancetype)initWithPaginationInfo:(NSDictionary *)paginationInfo;
- (NSString *)pageIndexAsString;
- (BOOL)isValidPageIndex;
- (BOOL)isFirstPageIndex;

@end
