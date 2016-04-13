//
//  showViewController.m
//  Touch3D
//
//  Created by 杨杰 on 16/3/17.
//  Copyright © 2016年 mondo. All rights reserved.
//

#import "showViewController.h"

@interface showViewController ()
@property (weak, nonatomic) IBOutlet UIView *jumpyView;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation showViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setTitleLabel:(UILabel *)titleLabel
{
    _titleLabel = titleLabel;
    NSLog(@"yes");
}
- (void)viewDidAppear:(BOOL)animated
{
    
    NSLog(@"titlelabel.text is %@",_titleLabel.text);
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"第一个" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        // 点击事件写到这里
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"第2个" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"第3个" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    UIPreviewAction *action4 = [UIPreviewAction actionWithTitle:@"第4个" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    NSArray *action = @[action1,action2,action3,action4];
    
    return action;
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
