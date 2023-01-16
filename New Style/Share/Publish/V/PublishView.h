//
//  PublishView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublishView : UIView
- (void)viewInit;
- (void)testPhoto;
@property (nonatomic, strong) UIImagePickerController *imagePicker;   //从相册调图片
@property (nonatomic, strong) UIImage *image;
@end

NS_ASSUME_NONNULL_END
