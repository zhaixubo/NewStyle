//
//  PhotoFixView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/8.
//

#import <UIKit/UIKit.h>
@protocol ButtonDelegate <NSObject>

- (void)getButton:(UIButton *_Nullable)button;

@end
NS_ASSUME_NONNULL_BEGIN

@interface PhotoFixView : UIView
- (void)viewInit;
- (void)requestBack;   //网络请求完成
@property (nonatomic, weak) id <ButtonDelegate> buttonDelegate;
@property (nonatomic, assign) int numberOfFix;   //记录第几个功能
@property (nonatomic, strong) UIImage *oldImage;   //传入的修复前照片
@property (nonatomic, strong) UIImageView *mainImageView;   //图片放置区域
@end

NS_ASSUME_NONNULL_END
