//
//  HomeView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol ImagePickerDelegate <NSObject>

- (void)presentAlert;

@end
@protocol PhotoFixDelegate <NSObject>

- (void)getPhotoFixNumber:(int)numberOfFix :(UIImage *_Nullable)image;

@end
@interface HomeView : UIView
- (void)viewInit;
@property (nonatomic, weak) id <ImagePickerDelegate> imageDelegate;
@property (nonatomic, weak) id <PhotoFixDelegate> photoFixDelegate;
@property (nonatomic, strong) UIImagePickerController *imagePicker;//从相册调图片
@end

NS_ASSUME_NONNULL_END
