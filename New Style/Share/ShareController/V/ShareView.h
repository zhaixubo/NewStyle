//
//  ShareView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareView : UIView
- (void)viewInit;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;   //分栏控件
@property (nonatomic, strong) UIScrollView *scrollView;   //滚动视图
@end

NS_ASSUME_NONNULL_END
