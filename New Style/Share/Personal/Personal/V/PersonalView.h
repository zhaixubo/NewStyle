//
//  PersonalView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol jumpDelegate <NSObject>

- (void)pageJumpNum:(int)pageTag;

@end

@interface PersonalView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *imageNameArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UITableView *personalTableView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signatureLabel;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIButton *stateButton;
@property (nonatomic, strong) UIButton *mailButton;
@property (nonatomic, strong) UIButton *positionButton;
@property (nonatomic, strong) UIButton *heartButton;
@property (nonatomic, strong) UIButtonConfiguration *buttonConfig;

@property (assign, nonatomic) id<jumpDelegate> pageJumpDelegate;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
