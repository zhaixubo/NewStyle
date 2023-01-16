//
//  LoginView.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/11.
//
#import "LoginView.h"
#import "Masonry.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface LoginView ()
@property (nonatomic, strong) UIButton *backButton;   //返回按钮
@property (nonatomic, strong) UILabel *wonderfulLabel;   //精彩label
@property (nonatomic, strong) UITextField *accountTextField;   //登录和注册的框
@property (nonatomic, strong) UITextField *passWordTextField;
@property (nonatomic, strong) UIButton *loginRegisterButton;   //登录注册按钮
@end

@implementation LoginView

- (void)viewInit {
    self.backgroundColor = [UIColor colorWithRed:(15.0f / 255.0f) green:(14.0f / 255.0f)blue:(18.0f / 255.0f) alpha:1.0f];
    [self buttonInit];
    [self labelInit];
    [self textFieldInit];
    [self intervalViewInit];
}
//各个按钮的创建
- (void)buttonInit {
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"cha.png"]] forState:UIControlStateNormal];
    self.backButton.tag = 0;
    [self addSubview:self.backButton];
    //状态栏高度
    NSSet *set = [UIApplication sharedApplication].connectedScenes;
    UIWindowScene *windowScene = [set anyObject];
    UIStatusBarManager *statusBarManager = windowScene.statusBarManager;
    [self.backButton mas_makeConstraints:^(MASConstraintMaker* make) {
        if (statusBarManager.statusBarFrame.size.height < 30) {
            make.top.equalTo(self).offset(43 - 20);
        } else {
            make.top.equalTo(self).offset(43);
        }
        make.height.equalTo(@25);
        make.width.equalTo(@25);
        make.top.equalTo(self).offset(43);
        make.left.equalTo(self).offset(20);
    }];
    [self.backButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 1; i <= 2; i++) {
        self.loginRegisterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.loginRegisterButton.tag = i;
        self.loginRegisterButton.frame = CGRectMake(60, 400 + (i - 1) * 80, SIZE_WIDTH - 120, 55);
        self.loginRegisterButton.layer.masksToBounds = YES;
        self.loginRegisterButton.layer.cornerRadius = 10;
        self.loginRegisterButton.backgroundColor = [UIColor colorWithRed:(37.0f / 255.0f) green:(35.0f / 255.0f)blue:(42.0f / 255.0f) alpha:1.0f];
        if (i == 1) {
            [self.loginRegisterButton setTitle:@"登录" forState:UIControlStateNormal];
        } else {
            [self.loginRegisterButton setTitle:@"注册" forState:UIControlStateNormal];
        }
        self.loginRegisterButton.tintColor = [UIColor whiteColor];
        self.loginRegisterButton.titleLabel.font = [UIFont systemFontOfSize:0.055 * SIZE_WIDTH];
        [self.loginRegisterButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.loginRegisterButton];
    }
}

- (void)labelInit {
    self.wonderfulLabel = [[UILabel alloc] init];
    self.wonderfulLabel.frame = CGRectMake(60, 90, 250, 100);
    self.wonderfulLabel.text = @"登录后更精彩";
    self.wonderfulLabel.textColor = [UIColor whiteColor];
    self.wonderfulLabel.font = [UIFont systemFontOfSize:28];
    [self addSubview:self.wonderfulLabel];
}

//按钮的点击事件
- (void)buttonReturn:(UIButton *)button {
    [self.loginButtonDelegate getButton:button];
}

- (void)textFieldInit {
    self.accountTextField = [[UITextField alloc] init];
    self.accountTextField.frame = CGRectMake(60, 220, SIZE_WIDTH - 120, 50);
    self.accountTextField.backgroundColor = [UIColor clearColor];
    self.accountTextField.tintColor = [UIColor whiteColor];
    self.accountTextField.textColor = [UIColor whiteColor];
    self.accountTextField.font = [UIFont systemFontOfSize:20];
    self.accountTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入账号/邮箱号" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:(123.0f / 255.0f) green:(120.0f / 255.0f)blue:(133.0f / 255.0f) alpha:1.0f],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    [self addSubview:self.accountTextField];
    
    self.passWordTextField = [[UITextField alloc] init];
    self.passWordTextField.frame = CGRectMake(60, 300, SIZE_WIDTH - 120, 50);
    self.passWordTextField.backgroundColor = [UIColor clearColor];
    self.passWordTextField.tintColor = [UIColor whiteColor];
    self.passWordTextField.textColor = [UIColor whiteColor];
    self.passWordTextField.font = [UIFont systemFontOfSize:20];
    self.passWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:(123.0f / 255.0f) green:(120.0f / 255.0f)blue:(133.0f / 255.0f) alpha:1.0f],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    [self addSubview:self.passWordTextField];
}

- (void)intervalViewInit {
    for (int i = 0; i < 2; i++) {
        UIView *intervalView = [[UIView alloc] init];
        intervalView.frame = CGRectMake(60, 270 + i * 80, SIZE_WIDTH - 120, 1);
        intervalView.backgroundColor = [UIColor colorWithRed:(123.0f / 255.0f) green:(120.0f / 255.0f)blue:(133.0f / 255.0f) alpha:1.0f];
        [self addSubview:intervalView];
    }
}
@end
