//
//  CustomCell.m
//  TwitterClient
//
//  Created by kerem on 19/04/14.
//  Copyright (c) 2014 manuyavuz. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat imageHeight = TWEET_CELL_IMAGE_HEIGHT;
    CGFloat imageWidth = TWEET_CELL_IMAGE_WIDTH;
    CGFloat margin = 5.0;
    self.imageView.frame = CGRectMake(margin,margin,imageWidth,imageHeight);
    float limgW =  self.imageView.image.size.width;
    if(limgW > 0) {
        self.textLabel.frame = CGRectMake(imageWidth+margin+10.0,0,255,self.textLabel.frame.size.height);
        self.textLabel.numberOfLines = 0;
        [self.textLabel sizeToFit];
        self.detailTextLabel.frame = CGRectMake(imageWidth+margin+10.0,self.textLabel.frame.size.height,self.detailTextLabel.frame.size.width,self.detailTextLabel.frame.size.height);
    }
    
}
@end
