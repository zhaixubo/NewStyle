//
//  PersonalTableViewCell.m
//  New Style
//
//  Created by zzy on 2022/12/24.
//

#import "PersonalTableViewCell.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation PersonalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor whiteColor];
    [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.contentView addSubview:_titleLabel];
    
    _buttonImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_buttonImageView];
    
    _secondImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_secondImageView];
    
    return self;
}

- (void)layoutSubviews {
    [_buttonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@40);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@95);
        make.width.equalTo(@(SIZE_WIDTH * 0.65));
        make.height.equalTo(@70);
    }];
    [_secondImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.top.mas_offset(22);
        make.right.mas_offset(-30);
    }];
}

@end
