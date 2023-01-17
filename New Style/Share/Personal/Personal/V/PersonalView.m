//
//  PersonalView.m
//  New Style
//
//  Created by 翟旭博 on 2022/12/6.
//

#import "PersonalView.h"
#import "Masonry.h"
#import "PersonalTableViewCell.h"

#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation PersonalView

- (void)viewInit {
    _backgroundView = [[UIView alloc] init];
    _backgroundView.backgroundColor = [UIColor grayColor];
    [_backgroundView.layer setMasksToBounds:YES];
    [_backgroundView.layer setCornerRadius:32];
    [self addSubview:_backgroundView];
    [_backgroundView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@65);
        make.left.equalTo(@(SIZE_WIDTH/2-(SIZE_WIDTH-50)/2));
        make.width.equalTo(@(SIZE_WIDTH-50));
        make.height.equalTo(@(SIZE_HEIGHT/3));
    }];
    _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head1.jpg"]];
    [_headImageView.layer setMasksToBounds:YES];
    [_headImageView.layer setCornerRadius:32];
    [self addSubview:_headImageView];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@85);
        make.left.equalTo(@(SIZE_WIDTH/2-60));
        make.width.equalTo(@120);
        make.height.equalTo(@120);
    }];
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = @"ArnoVD97";
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.backgroundColor = [UIColor clearColor];
    [_nameLabel setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:28]];
    [_backgroundView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@(SIZE_HEIGHT/10));
        make.left.equalTo(@((SIZE_WIDTH-50)/2-65));
        make.width.equalTo(@150);
        make.height.equalTo(@150);
    }];
    _buttonConfig = [UIButtonConfiguration plainButtonConfiguration];
//    [_buttonConfig setImage:[UIImage imageNamed:@"mail.png"]];
//    _buttonConfig.title = @"状态";
    
//    _buttonConfig.subtitle = @"投个币吧";
    _buttonConfig.buttonSize = UIButtonConfigurationSizeLarge;
    _buttonConfig.showsActivityIndicator = NO;//菊花指示器HUD图标，和image不能同时存在
//    _buttonConfig.attributedTitle = @"attributed";
//    _buttonConfig.baseBackgroundColor = [UIColor redColor];
//  文本颜色优先级低于AttributrTitle/SubTitle以及变形器，为一个全局设置变量，当你想让按钮任何状态时文本颜色不变时，可以设置这个值
    _buttonConfig.baseForegroundColor = [UIColor blackColor];
    //目前不知道优先级高低，不知道有什么作用,且不知道被什么方法覆盖掉了
//    _buttonConfig.preferredSymbolConfigurationForImage = [UIImageSymbolConfiguration configurationWithPointSize:30];
    //设置富标题和富子标题
//    _buttonConfig.attributedSubtitle = [[NSAttributedString alloc] initWithString:@"high " attributes:@{:[UIColor systemRedColor]}];
    //图片颜色变形器，当你输入一个颜色，再输出颜色的回调，不知道能干啥，可在回调内直接返回你想要设置的颜色即可
    _buttonConfig.imageColorTransformer = ^UIColor * _Nonnull(UIColor * _Nonnull color) {
        return [UIColor systemPurpleColor];
    };
//    _buttonConfig.image = [UIImage imageNamed:@"state.png"];
//    _buttonConfig = [UIButtonConfiguration borderlessButtonConfiguration];
    //图片与文字的相对位置
    _buttonConfig.imagePlacement = NSDirectionalRectEdgeTop;
//    图片与标题的间距
    _buttonConfig.imagePadding = 15;
//    标题与字幕的间距
    _buttonConfig.titlePadding = 0;
    _buttonConfig.buttonSize = UIButtonConfigurationSizeMedium;
    _buttonConfig.titleAlignment = UIButtonConfigurationTitleAlignmentCenter;
    //内容四边距，目前不知道能干啥
//    _buttonConfig.contentInsets = NSDirectionalEdgeInsetsMake(0, 0, 0, 0);
    
//还不会用这个，到时候在看，swift里面应该很好用
//    UIBackgroundConfiguration* backgroundConfig = [UIBackgroundConfiguration clearConfiguration];
//    backgroundConfig.backgroundColor = [UIColor greenColor];
//    backgroundConfig.cornerRadius = 20;
//    _buttonConfig.background = backgroundConfig;
    
//状态按钮
    _stateButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
    [_stateButton setImage:[UIImage imageNamed:@"state.png"] forState:UIControlStateNormal];
    [_stateButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    _stateButton.tag = 101;
//    [_stateButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica_Bold" size:30]];
    [_stateButton setImage:[UIImage imageNamed:@"state1.png"] forState:UIControlStateHighlighted];
    [_stateButton setTitle:@"状态" forState:UIControlStateNormal];
    _stateButton.configuration.subtitle = @"设状态";
//    _stateButton.configurationUpdateHandler
//    _stateButton.titleLabel.font = [UIFont systemFontOfSize:32];
//    [_stateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_stateButton];
    [_stateButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
        make.left.equalTo(@(37.5));
    }];

//    邮件按钮
    _mailButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
    [_mailButton setImage:[UIImage imageNamed:@"mail.png"] forState:UIControlStateNormal];
    [_mailButton setImage:[UIImage imageNamed:@"mail1.png"] forState:UIControlStateHighlighted];
    [_mailButton setTitle:@"邮件" forState:UIControlStateNormal];
    [_mailButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    _mailButton.tag = 102;
    
    _mailButton.titleLabel.hidden = NO;
    [self addSubview:_mailButton];
    [_mailButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
        make.left.equalTo(@(132.5));
    }];
    
//    位置按钮
    _positionButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
    [_positionButton setImage:[UIImage imageNamed:@"user.png"] forState:UIControlStateNormal];
    [_positionButton setTitle:@"个人" forState:UIControlStateNormal];
    [_positionButton setImage:[UIImage imageNamed:@"user1.png"] forState:UIControlStateHighlighted];
    [_positionButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    _positionButton.tag = 103;
    [self addSubview:_positionButton];
    [_positionButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
        make.left.equalTo(@227.5);
    }];
    
    //喜欢按钮
    _heartButton = [UIButton buttonWithConfiguration:_buttonConfig primaryAction:nil];
    [_heartButton setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
    [_heartButton setTitle:@"喜欢" forState:UIControlStateNormal];
    [_heartButton setImage:[UIImage imageNamed:@"heart1.png"] forState:UIControlStateHighlighted];
    [_heartButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    _heartButton.tag = 104;
    [self addSubview:_heartButton];
    [_heartButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@((SIZE_HEIGHT/3)-50));
        make.left.equalTo(@317.5);
    }];
    //学习时用的demo先放在这里，到时候删了
//    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButtonConfiguration* btnConfig = [UIButtonConfiguration filledButtonConfiguration];
//    btn.configurationUpdateHandler = ^(UIButton *b) {
//            if (b.state == UIControlStateHighlighted) {
//                btnConfig.showsActivityIndicator = YES;
//                btnConfig.attributedTitle = [[NSAttributedString alloc] initWithString:@"Highlighted Title" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.attributedSubtitle = [[NSAttributedString alloc] initWithString:@"Highlighted Subtitle" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.image = [UIImage systemImageNamed:@"square.and.arrow.up.fill"];
//                btnConfig.activityIndicatorColorTransformer = ^UIColor * _Nonnull(UIColor * _Nonnull color) {
//                    return [UIColor systemPurpleColor];
//                };
//                ///这个赋值操作必须写，不然不生效
//                b.configuration = btnConfig;
//            }else {
//                btnConfig.showsActivityIndicator = NO;
//                btnConfig.attributedTitle = [[NSAttributedString alloc] initWithString:@"Normal Title" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.attributedSubtitle = [[NSAttributedString alloc] initWithString:@"Normal Subtitle" attributes:@{NSForegroundColorAttributeName:[UIColor systemRedColor]}];
//                btnConfig.imagePadding = 10;
//                btnConfig.baseBackgroundColor = [UIColor grayColor];
//                btnConfig.image = [UIImage systemImageNamed:@"applelogo"];
//                btnConfig.imageColorTransformer = ^UIColor * _Nonnull(UIColor * _Nonnull color) {
//                    return [UIColor systemOrangeColor];
//                };
//                ///这个赋值操作必须写，不然不生效
//                b.configuration = btnConfig;
//            }
//        };
//    [self addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker* make) {
//        make.top.equalTo(@((SIZE_HEIGHT/2)-50));
//        make.left.equalTo(@150);
//    }];
        
    self.personalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SIZE_HEIGHT/3+70, SIZE_WIDTH, SIZE_HEIGHT) style:UITableViewStylePlain];
    self.personalTableView.backgroundColor = [UIColor clearColor];
    _personalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _personalTableView.dataSource = self;
    _personalTableView.delegate = self;
    [_personalTableView setSeparatorColor:[UIColor grayColor]];
    [self addSubview:_personalTableView];
    _imageNameArray = [[NSArray alloc] initWithObjects:@"message.png",@"picture.png",@"help.png",@"connectUs.png",@"cog.png",@"poweroff.png",nil];
    _titleArray = [[NSArray alloc] initWithObjects:@"通知",@"朋友圈",@"帮助",@"联系我们",@"设置",@"退出", nil];
    [_personalTableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"personalCell"];
    NSLog(@"+++++++++++++++++++++++++++++++++++++___________________________");
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_pageJumpDelegate pageJumpNum:(int)indexPath.row];
    //    [self.personalTableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalTableViewCell *personalCell = [self.personalTableView dequeueReusableCellWithIdentifier:@"personalCell" forIndexPath:indexPath];
    personalCell.selectionStyle = UITableViewCellSelectionStyleGray;
    personalCell.buttonImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: _imageNameArray[indexPath.row]]];
    personalCell.titleLabel.text = _titleArray[indexPath.row];
    [personalCell.contentView addSubview:personalCell.buttonImageView];
    personalCell.secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"next.png"]];
    [personalCell.contentView addSubview:personalCell.secondImageView];
    return personalCell;
}

- (void)buttonReturn:(UIButton *)button {
    
}
@end
