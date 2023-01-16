//
//  PhotoFixViewController.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/8.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoFixViewController : ViewController 
@property (nonatomic, assign) int numberOfFix;   //记录第几个功能
@property (nonatomic, strong) UIImage *oldImage;   //传入的修复前照片
@end

NS_ASSUME_NONNULL_END
