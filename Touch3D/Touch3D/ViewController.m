//
//  ViewController.m
//  Touch3D
//
//  Created by 。。 on 16/1/9.
//  Copyright © 2016年 mondo. All rights reserved.
//

#import "ViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"
#import "showViewController.h"

static NSString *identifier = @"cell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDataSource];
    [self initUserInterface];
}

- (void) initDataSource
{
    self.dataSource = @[@"动态标签",
                        @"UIApplicationShortcutItem  创建3DTouch标签的类",
                        @"UIMutableApplicationShortcutItem 创建可变的3DTouch标签的类",
                        @"UIApplicationShortcutIcon 创建标签中图片Icon的类",
                        @"创建好标签后，将其添加如application的hortcutItems数组中即可",
                        @"类似推送，当我们点击标签进入应用程序时，也可以进行一些操作，我们可以看到，在applocation中增加了这样一个方法： ",
                        @"当我们通过标签进入app时，就会在appdelegate中调用这样一个回调，我们可以获取shortcutItem的信息进行相关逻辑操作。",
                        @"也需要进行一下判断，在launchOptions中有UIApplicationLaunchOptionsShortcutItemKey这样一个键，通过它，我们可以区别是否是从标签进入的app，如果是则处理结束逻辑后，返回NO，防止处理逻辑被反复回调。"];
}
- (IBAction)one:(id)sender
{
    oneViewController *vc = [[oneViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)two:(id)sender
{
    twoViewController *vc = [[twoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) initUserInterface
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.restorationIdentifier = identifier;
    

    
}

#pragma mark -- UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    // 这里判断是否支持3D Touch功能
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        NSLog(@"3D Touch  可用!");
        //如果支持，给cell注册3DTouch的peek（预览）和pop功能
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    } else {
        NSLog(@"3D Touch 无效");
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    showViewController *showVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"showViewController"];
    showVC.titleLabel.text  = self.dataSource[indexPath.row];
//    showVC.string = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:showVC animated:YES];
}

#pragma mark - UIViewControllerPreviewingDelegate
// 预览效果
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    // 记录是哪一个cell被按，[previewingContext sourceView]就是按压的那个视图
    NSIndexPath *index = [self.tableView indexPathForCell:(UITableViewCell *)[previewingContext sourceView]];
    // 设定预览界面
    showViewController *showVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"showViewController"];
    showVC.titleLabel.text = self.dataSource[index.row];
    showVC.preferredContentSize = CGSizeMake(0, 500);
    //调整不被虚化的范围，按压的那个cell不被虚化（轻轻按压时周边会被虚化，再少用力展示预览，再加力跳页至设定界面）
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width,40);
    previewingContext.sourceRect = rect;
    
    return showVC;
}

// 用力按进入
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}




@end






