//
//  Pagination.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "Pagination.h"

static NSString *const pages = @"pages";
static NSString *const perpage = @"perpage";
static NSString *const page = @"page";

@implementation Pagination

- (instancetype)initWithPaginationInfo:(NSDictionary *)paginationInfo
{
    self = [super init];
    if (self) {
        _pageIndex = [paginationInfo[page] integerValue];
        _itemsPerPage = [paginationInfo[perpage] integerValue];
        _maximumPages = [paginationInfo[pages] integerValue];
    }
    return self;
}

- (NSString *)pageIndexAsString
{
    return [NSString stringWithFormat:@"%ld",_pageIndex];
}

- (BOOL)isValidPageIndex
{
    return _pageIndex < _maximumPages;
}

- (BOOL)isFirstPageIndex
{
    return _pageIndex == 1;
}

@end
