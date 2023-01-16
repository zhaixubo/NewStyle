//
//  PlusCollectionViewCell.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/30.
//

#import "PlusCollectionViewCell.h"
@interface PlusCollectionViewCell ()
@property (nonatomic, strong) UIImageView *mainImageView;
@end
@implementation PlusCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.mainImageView = [[UIImageView alloc] init];
    self.mainImageView.image = [UIImage imageNamed:@"jiahao的副本.png"];
    self.mainImageView.layer.masksToBounds = YES;
    self.mainImageView.layer.cornerRadius = (self.frame.size.width - 20) / 2;
    [self.contentView addSubview:self.mainImageView];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.mainImageView.frame = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 20);
}
@end
