//
//  GameView.h
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameView : UIView
- (void)viewInit;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSMutableArray *photoArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) int flagOfPhoto;
@property (nonatomic, assign) int flagOfDelete;
- (void)insertPhotoDataBase:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
