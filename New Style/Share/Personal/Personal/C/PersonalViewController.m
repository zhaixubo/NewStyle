//
//  PersonalViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import "PersonalViewController.h"
#import "PersonalView.h"
#import "SettingViewController.h"
@interface PersonalViewController ()
@property (nonatomic, strong) PersonalView* personView;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.title = @"我的";
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
    [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 10)];
    [tabBarItem setImageInsets:UIEdgeInsetsMake(3, 0, -3, 0)];
    tabBarItem.image = [[UIImage imageNamed: @"wode1.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed: @"wode2.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    _personView = [[PersonalView alloc] initWithFrame:self.view.frame];
    
    [self.personView viewInit];
    self.personView.pageJumpDelegate = self;
    [self.view addSubview:self.personView];

}
- (void)pageJumpNum:(int)pageTag {
    if (pageTag == 0) {
        NSLog(@"0");
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"通知" message:@"目前没有通知" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sure];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (pageTag == 1) {
        NSLog(@"1");
    } else if (pageTag == 2) {
        NSLog(@"2");
    } else if (pageTag == 3) {
        NSLog(@"3");
    } else if (pageTag == 4) {
        SettingViewController *settingViewController = [[SettingViewController alloc] init];
        [self presentViewController:settingViewController animated:YES completion:nil];
        NSLog(@"4");
    } else if (pageTag == 5) {
        UIAlertController *closeAlertController = [UIAlertController alertControllerWithTitle:@"退出登陆" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *no = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:nil];
        [closeAlertController addAction:sure];
        [closeAlertController addAction:no];
        [self presentViewController:closeAlertController animated:YES completion:nil];
        NSLog(@"5");
    }
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
