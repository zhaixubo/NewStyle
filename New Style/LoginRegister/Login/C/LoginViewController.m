//
//  LoginViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/11.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"
@interface LoginViewController () <LoginButtonDelegate>
@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) RegisterViewController *registerViewController;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginView = [[LoginView alloc] initWithFrame:self.view.frame];
    self.loginView.loginButtonDelegate = self;
    [self.loginView viewInit];
    [self.view addSubview:self.loginView];
}


- (void)getButton:(UIButton *)button {
    if (button.tag == 0) {   //退出
        [[UIApplication sharedApplication]performSelector:@selector(suspend)];
    } else if (button.tag == 1) {   //登录
         
    } else if (button.tag == 2) {   //注册
        self.registerViewController = [[RegisterViewController alloc] init];
        self.registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:self.registerViewController animated:YES completion:nil];
    }
}
@end
