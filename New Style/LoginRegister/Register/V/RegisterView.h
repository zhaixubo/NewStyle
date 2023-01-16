//
//  RegisterView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RegisterButtonDelegate <NSObject>

- (void)getButton:(UIButton *)button;

@end
@interface RegisterView : UIView
- (void)viewInit;
@property (nonatomic, weak) id<RegisterButtonDelegate> registerButtonDelegate;
@end

NS_ASSUME_NONNULL_END
