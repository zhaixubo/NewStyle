//
//  SettingView.m
//  New Style
//
//  Created by zzy on 2023/1/14.
//

#import "SettingView.h"
#import "SettingTableViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation SettingView

- (void)viewInit {
    _settingArray = [[NSArray alloc] initWithObjects:@"恢复购买信息",@"照片裁剪动画",@"照片锐化动画",@"自动照片滤镜",@"保存照片详细信息",@"清除缓存",@"相册排序依据",nil];
    self.backgroundColor = [UIColor blackColor];
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"angleLeft.png"]] forState:UIControlStateNormal];
    _backButton.tag = 0;
    _backButton.frame = CGRectMake(5, 20, 30, 30);
    [_backButton addTarget:self action:@selector(buttonReturn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backButton];
    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, SIZE_WIDTH, SIZE_HEIGHT) style:UITableViewStylePlain];
    _settingTableView.delegate = self;
    _settingTableView.dataSource = self;
    [_settingTableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"settingCell"];
    
}
- (void)buttonReturn {
    [_pageJumpDelegate pageJumpNum:(int)_backButton.tag];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 4;
    } else if (section == 2) {
        return 3;
    } else {
        return 0;
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
