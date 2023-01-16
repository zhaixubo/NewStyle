//
//  SettingView.h
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import <UIKit/UIKit.h>
#import "PersonalView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SettingView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSArray *settingArray;
@property (nonatomic, strong)UIButton *backButton;
@property (nonatomic, strong)UITableView *settingTableView;
@property (nonatomic, assign)id<jumpDelegate> pageJumpDelegate;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
