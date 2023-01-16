//
//  HomeViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import "HomeViewController.h"
#import "PhotoFixViewController.h"
#import "HomeView.h"
@interface HomeViewController () <ImagePickerDelegate, PhotoFixDelegate>
@property (nonatomic, strong) HomeView *homeView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.homeView = [[HomeView alloc] initWithFrame:self.view.frame];
    self.navigationController.navigationBar.hidden = YES;
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.title = @"主页";
    [tabBarItem  setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
    [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 10)];
    [tabBarItem setImageInsets:UIEdgeInsetsMake(3, 0, -3, 0)];
    tabBarItem.image = [[UIImage imageNamed: @"zhuye.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [[UIImage imageNamed: @"zhuye2.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = tabBarItem;
    [self.view addSubview:self.homeView];
    [self.homeView viewInit];
    self.homeView.imageDelegate = self;
    self.homeView.photoFixDelegate = self;
}

- (void)presentAlert {
    //创建sheet提示框，提示选择相机还是相册
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请选择照片来源" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
         UIAlertAction * camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

          //选择相机时，设置UIImagePickerController对象相关属性
        self.homeView.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.homeView.imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
      //    imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
        self.homeView.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
          //跳转到UIImagePickerController控制器弹出相机
        [self presentViewController:self.homeView.imagePicker animated:YES completion:nil];
    }];

        //相册选项
    UIAlertAction * photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        //选择相册时，设置UIImagePickerController对象相关属性
        self.homeView.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //跳转到UIImagePickerController控制器弹出相册
        [self presentViewController:self.homeView.imagePicker animated:YES completion:nil];
    }];

    //取消按钮
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        //[self dismissViewControllerAnimated:YES completion:nil];
    }];
    //添加各个按钮事件
    [alert addAction:camera];
    [alert addAction:photo];
    [alert addAction:cancel];
    //弹出sheet提示框
    [self presentViewController:alert animated:YES completion:nil];
}

//进入修复界面
- (void)getPhotoFixNumber:(int)numberOfFix :(UIImage *)image{
    PhotoFixViewController *photoFixViewController = [[PhotoFixViewController alloc] init];
    photoFixViewController.numberOfFix = numberOfFix;
    photoFixViewController.oldImage = image;
    [self presentViewController:photoFixViewController animated:YES completion:nil];
}
@end
