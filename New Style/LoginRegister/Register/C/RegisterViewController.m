//
//  RegisterViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/11.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
@interface RegisterViewController () <RegisterButtonDelegate>
@property (nonatomic, strong) RegisterView *registerView;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.registerView = [[RegisterView alloc] initWithFrame:self.view.frame];
    [self.registerView viewInit];
    self.registerView.registerButtonDelegate = self;
    [self.view addSubview:self.registerView];
}
- (void)getButton:(UIButton *)button{
    if (button.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        
    }
}
@end
