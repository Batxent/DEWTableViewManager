//
//  DEWTableViewCell.m
//  DEWTableViewManager
//
//  Created by Shaw on 2019/1/17.
//  Copyright © 2019 Forcewith Co., Ltd. All rights reserved.
//

#import "DEWTableViewCell.h"
#import <Masonry.h>


@interface DEWTableViewCell ()



@end


@implementation DEWTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) return nil;
    
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.detailLabel];
    
    return self;
}

- (UIImageView *)avatarImageView
{
    if (_avatarImageView) return _avatarImageView;
    _avatarImageView = [[UIImageView alloc]init];
    return _avatarImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel) return _nameLabel;
    _nameLabel = [[UILabel alloc]init];

    return _nameLabel;
}

- (UILabel *)detailLabel
{
    if (_detailLabel) return _detailLabel;
    _detailLabel = [[UILabel alloc]init];
    return _detailLabel;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)updateConstraints
{
    
    [self.avatarImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
//        make.centerY.equalTo(self.contentView.mas_centerY);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.width.height.equalTo(@(55));
    }];
    
    [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right).offset(11);
        make.bottom.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    
    [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(4);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    [super updateConstraints];
}


@end
