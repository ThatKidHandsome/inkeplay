//
//  HRHotLiveCell.m
//  inke
//
//  Created by 众力金融 on 16/11/1.
//  Copyright © 2016年 众力金融. All rights reserved.
//

#import "HRHotLiveCell.h"
#import "HRLive.h"
#import "UIImageView+CornerRadius.h"


@interface HRHotLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *IconImageview;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (weak, nonatomic) IBOutlet UILabel *onLineUserLabel;

@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@property (weak, nonatomic) IBOutlet UIView *bgview;



@end

@implementation HRHotLiveCell


- (void)setLive:(HRLive *)live
{
    _live = live;
    
//    NSLog(@"%@",live.creator.nick);
    self.nameLabel.text = live.name;
    self.cityLabel.text = live.city;
    self.onLineUserLabel.text = [@(live.online_users) stringValue];
//    [self.IconImageview setHeader:[NSString stringWithFormat:@"%@/%@",IMAGE_HOST,live.creator.portrait]];
    [self.IconImageview downloadImage:[NSString stringWithFormat:@"%@/%@",IMAGE_HOST,live.creator.portrait] placeholder:nil];
    //[self.IconImageview zy_cornerRadiusAdvance:self.IconImageview.frame.size.width / 2 rectCornerType:UIRectCornerAllCorners];
    [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@/%@",IMAGE_HOST,live.creator.portrait] placeholder:nil];
   
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.IconImageview.layer.masksToBounds = YES;
    self.IconImageview.layer.cornerRadius = 25;
    
}

- (void)layoutSubviews {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
