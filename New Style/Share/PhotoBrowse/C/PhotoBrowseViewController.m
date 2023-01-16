//
//  PhotoBrowseViewController.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/17.
//

#import "PhotoBrowseViewController.h"
#import "PhotoBrowseView.h"
@interface PhotoBrowseViewController ()
@property (nonatomic, strong) PhotoBrowseView *photoBrowseView;
@property (nonatomic, strong) UIAlertController *saveAlertController;   //保存
@end

@implementation PhotoBrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoBrowseView = [[PhotoBrowseView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.photoBrowseView];
    self.photoBrowseView.shareImage = self.shareImage;
    self.photoBrowseView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTapClick:)];   //轻点
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressClick:)];   //长按
    [self.photoBrowseView addGestureRecognizer:tapGestureRecognizer];
    [self.photoBrowseView addGestureRecognizer:longPressGesture];
    [self.photoBrowseView viewInit];
}
//轻点
- (void)pressTapClick:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//长按
- (void)longPressClick:(UILongPressGestureRecognizer *)press {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
         UIAlertAction * save = [UIAlertAction actionWithTitle:@"保存到相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             //保存图片
             [self loadImageFinished:self.shareImage];
    }];
    //取消按钮
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    //添加各个按钮事件
    [alert addAction:save];
    [alert addAction:cancel];
    //弹出sheet提示框
    [self presentViewController:alert animated:YES completion:nil];
}

//保存图片到相册
- (void)loadImageFinished:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    self.saveAlertController = [UIAlertController alertControllerWithTitle:nil message:@"已保存到相册" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:self.saveAlertController animated:YES completion:nil];
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:1  target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:myTimer forMode:NSRunLoopCommonModes];
}
- (void)timeOut {
    [self.saveAlertController dismissViewControllerAnimated:YES completion:nil];
}

@end
