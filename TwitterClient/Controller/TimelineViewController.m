//
//  TimelineViewController.m
//  TwitterClient
//
//  Created by Yavuz Nuzumlali on 15/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "TimelineViewController.h"
#import "Tweet.h"
#import "AFNetworking.h"
#import "TweetCell.h"

@interface TimelineViewController ()

@end

@implementation TimelineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

CGFloat const TextLabelFont = TWEET_TEXT_FONT_SIZE;
CGFloat const DetailTextLabelFont = TWEET_USER_FONT_SIZE;

- (UIFont*)textLabelFont
{
    return [UIFont systemFontOfSize:TextLabelFont];
}

- (UIFont*)detailTextLabelFont
{
    return [UIFont systemFontOfSize:DetailTextLabelFont];
}

#pragma mark - tableview delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CGFloat height = 0;
    Tweet *tweet = self.dataArray[indexPath.row];

    CGSize size = [tweet.text  boundingRectWithSize:CGSizeMake(250.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[self textLabelFont]} context:nil].size;

    height += size.height;
    float cellWidth = TWEET_CELL_TEXT_WIDTH; //neden direk parametre olarak geciremiyorum
    
    size = [tweet.user.screenName sizeWithFont:[self textLabelFont] constrainedToSize:CGSizeMake(cellWidth, CGFLOAT_MAX) lineBreakMode:NSLineBreakByTruncatingTail];

    height += size.height;
    
    height += 10;


    return ceilf(height);
    
}

- (TweetCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TimelineCell";
    TweetCell *cell;
//    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[TweetCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Tweet *tweet = self.dataArray[indexPath.row];
    cell.textLabel.font = [self textLabelFont];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = tweet.text;
    CGFloat imageHeight = TWEET_CELL_IMAGE_HEIGHT;
    CGFloat imageWidth = TWEET_CELL_IMAGE_WIDTH;
   if(tweet.user.profileImage)
    {
        cell.imageView.image = [ImageUtil resizeImage:tweet.user.profileImage withWidth:imageWidth withHeight:imageHeight];
        cell.imageView.bounds = CGRectMake(0, 0, imageWidth, imageHeight);

    }
    
    
    cell.detailTextLabel.textColor = [UIColor magentaColor];
    cell.detailTextLabel.font = [self detailTextLabelFont];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"@%@",tweet.user.screenName];
    
    return cell;
}

- (void)refreshData
{
    __weak TimelineViewController *weakSelf = self;
    [[RequestManager sharedManager] requestWithRequestType:RequestTypeTimeline completion:^(BOOL succeeded, id response, NSError *error) {
        if(succeeded)
        {
            NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in response) {
                Tweet *tweet = [[Tweet alloc] initWithDictionary:dict];
                [tmpArray addObject:tweet];
                
                NSURLRequest *request = [NSURLRequest requestWithURL:tweet.user.profileImageURL];
                    
                AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
                requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
                [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                    tweet.user.profileImage = responseObject;
                    int index = [weakSelf.dataArray indexOfObject:tweet];
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
                    
                    if ([weakSelf.tableView cellForRowAtIndexPath:indexPath])
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
                            CGFloat imageHeight = TWEET_CELL_IMAGE_HEIGHT;
                            CGFloat imageWidth = TWEET_CELL_IMAGE_WIDTH;
                            cell.imageView.image = [ImageUtil resizeImage:tweet.user.profileImage withWidth:imageWidth withHeight:imageHeight];
                            cell.imageView.bounds = CGRectMake(0, 0, imageWidth, imageHeight);
                            /*
                            cell.detailTextLabel.text = [NSString stringWithFormat:@"@%@",tweet.user.screenName];
                            cell.textLabel.text = tweet.text;
                            cell.textLabel.font = [self textLabelFont];
                             */
                            [weakSelf.tableView  reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                             

                        });
                    }
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    NSLog(@"Image error: %@", error);
                }];
                [requestOperation start];
                
            }
            //            [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationBottom];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.dataArray = tmpArray;
                [weakSelf.tableView reloadData];
            });
        }
        else
        {
            NSLog(@"TIMELINE FAILED!!\nResponse : %@\nError : %@",response,[error debugDescription]);
        }
    }];
}

#pragma mark- view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self refreshData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
