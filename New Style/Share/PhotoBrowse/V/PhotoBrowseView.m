//
//  PhotoBrowseView.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/17.
//

#import "PhotoBrowseView.h"
#import "Masonry.h"
@interface PhotoBrowseView ()
@property (nonatomic, strong) UIImageView *mainImageView;
@end
@implementation PhotoBrowseView

- (void)viewInit {
    self.backgroundColor = [UIColor blackColor];
    [self addSubview:self.mainImageView];
    [self addMasonry];
}
- (UIImageView *)mainImageView {
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.image = self.shareImage;
        _mainImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _mainImageView;
}
- (void)addMasonry {
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.left.equalTo(self).offset(5);
        make.right.equalTo(self).offset(-5);
        make.bottom.equalTo(self).offset(-200);
    }];
}
@end
