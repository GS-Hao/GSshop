//
//  FavoriteCell.m
//  xiangle
//
//  Created by wei cui on 2020/3/29.
//  Copyright © 2020 wei cui. All rights reserved.
//

#import "FavoriteCell.h"
#import <SDWebImage/SDWebImage.h>

@implementation FavoriteCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"favorite";
    // 1.缓存中取
    //FavoriteCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    FavoriteCell *cell = nil;
    // 2.创建
    if (cell == nil) {
        cell = [[FavoriteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //灰色的线
        _line=[[UIView alloc] init];
        _line.backgroundColor=CWGlobalBgColor;
        [self.contentView addSubview:_line];
    }
    return self;
}
-(void)setField:(Favorite *)field{
    _field=field;
    if (![field.content isEqualToString:@""]) {
        self.textLabel.text=field.content;
    }
    
    if (field.image && ![field.image isEqualToString:@""]) {
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"https://cw-test.oss-cn-hangzhou.aliyuncs.com/%@?x-oss-process=image/resize,w_80", field.image]];
        [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"picture2"]];
    }
    [self layoutIfNeeded];
    if (field.type==1) {
        field.cellHeight=CGRectGetMaxY(self.textLabel.frame)+10;//计算cell的高度
    }else{
        field.cellHeight=CGRectGetMaxY(self.imageView.frame)+10;//计算cell的高度
    }
}
/**
 重新布局子view
 */
- (void)layoutSubviews{
    [super layoutSubviews];//继承父类
    self.textLabel.font=[UIFont systemFontOfSize:14];
    
    if (self.imageView.image!=nil) {
        self.imageView.frame=CGRectMake(10, 20, 80, 80);
        self.textLabel.x=100;
    }else{
        //无图
        self.textLabel.frame=CGRectMake(10, 20, CWScreenW-20, 20);
        self.textLabel.numberOfLines=0;
        [self.textLabel sizeToFit];
    }
    _line.frame=CGRectMake(0, 0, CWScreenW, 10);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
