//
//  FirstCollectionViewCell.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/30.
//

#import "FirstCollectionViewCell.h"
@interface FirstCollectionViewCell ()
@property (nonatomic, strong) UIImageView *mainImageView;
@end
@implementation FirstCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    for (int i = 0; i < 3; i++) {
        self.mainImageView = [[UIImageView alloc] init];
        self.mainImageView.backgroundColor = [UIColor whiteColor];
        self.mainImageView.frame = CGRectMake(0 + i * 10, 0 + i * 10, self.frame.size.width - 20, self.frame.size.width - 20);
        self.mainImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"meixi%d.jpg", i + 1]];
        [self.contentView addSubview:self.mainImageView];
    }
    return self;
}
- (void)layoutSubviews {
    
}
@end
