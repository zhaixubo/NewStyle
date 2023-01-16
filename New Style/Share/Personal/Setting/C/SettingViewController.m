//
//  SettingViewController.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "SettingViewController.h"
#import "SettingView.h"
#import "PersonalView.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SettingView *setting = [[SettingView alloc] initWithFrame:self.view.frame];
    [setting viewInit];
    setting.pageJumpDelegate = self;
    [self.view addSubview:setting];
}
- (void)pageJumpNum:(int)pageTag {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
