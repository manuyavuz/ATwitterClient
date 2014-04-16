//
//  BaseTableViewController.h
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)   UIRefreshControl    *refreshControl;
@property (nonatomic, strong)   UITableView *tableView;
@property (nonatomic, strong)   NSMutableArray  *dataArray;
@property (nonatomic, strong)   UITableViewController *tableController;

- (void)refreshData;

@end
