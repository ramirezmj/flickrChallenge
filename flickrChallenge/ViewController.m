//
//  ViewController.m
//  flickrChallenge
//
//  Created by Jose Manuel Ramírez Martínez on 06/02/2017.
//  Copyright © 2017 Jose Manuel Ramírez Martínez. All rights reserved.
//

#import "ViewController.h"
#import "NetworkProvider.h"
#import "ModelProvider.h"
#import "Pagination.h"
#import "ArrayDataSource.h"
#import "HomeTVC.h"
#import "HomeTVC+ConfigureForPhoto.h"
#import "Photo.h"
#import "SwitchButtonProtocol.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, SwitchButtonProtocol>

@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) Pagination *pagination;
@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;

@end

static NSString * const cellIdentifier = @"HomeTVC";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NetworkProvider searchPhotosInPage:_pagination ? @(_pagination.pageIndex) : @(1) withCompletionBlock:[self completionBlockForSearchPhotosNetworkRequest]];
    self.navigationItem.title = @"Flickr Challenge";
    
    [self.tableView registerNib:[HomeTVC nib] forCellReuseIdentifier:cellIdentifier];
}


- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(HomeTVC *cell, Photo *photo) {
        [cell configureForPhoto:photo];
        [cell setDelegate:self];
    };
    NSArray *photos = self.items;
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
                                                         cellIdentifier:cellIdentifier
                                                     configureCellBlock:configureCell];
    self.tableView.dataSource = self.photosArrayDataSource;
    
}

- (void (^)(NSDictionary *))completionBlockForSearchPhotosNetworkRequest
{
    __weak typeof (self) weakSelf = self;
    return ^(NSDictionary *result) {
        
        if (!weakSelf.items) {
            weakSelf.items = [ModelProvider getPhotosFromDictionary:result[@"photos"]].mutableCopy;
        } else {
            [weakSelf.items addObjectsFromArray:[ModelProvider getPhotosFromDictionary:result[@"photos"]]];
        }
        
        weakSelf.pagination = [[Pagination alloc] initWithPaginationInfo:result[@"photos"]];
        [weakSelf setupTableView];
        weakSelf.pagination.pageIndex = weakSelf.pagination.pageIndex+1;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    };
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [[DetailViewController alloc] initWithPhoto:self.items[indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UIScrollView methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat distanceToBottom = scrollView.contentSize.height - (scrollView.contentOffset.y + scrollView.frame.size.height);
    if ([self.pagination isValidPageIndex] && !distanceToBottom) {
        [NetworkProvider searchPhotosInPage:_pagination ? @(_pagination.pageIndex) : @(1) withCompletionBlock:[self completionBlockForSearchPhotosNetworkRequest]];
    }
}


#pragma mark - SwitchButtonProtocol

- (void)returnToggledCell:(HomeTVC *)cell sender:(UISwitch *)toggle
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    Photo *photoItem = self.items[indexPath.row];
    photoItem.enabled = toggle.on;
    NSLog(@"%d", photoItem.enabled);
    NSLog(@"Toogled switch with indexPath: %ld", (long)indexPath.row);
}

@end
