//
//  TouchViewController.m
//  3DTouchDemo
//
//  Created by WeiCheng—iOS_1 on 16/1/14.
//  Copyright © 2016年 WeiCheng—iOS_1. All rights reserved.
//

#import "TouchViewController.h"

@interface TouchViewController ()
@property (weak, nonatomic) UIView *circleView;
@end

@implementation TouchViewController

- (UIView *)circleView {
    if (!_circleView) {
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        v.layer.cornerRadius = 50.f;
        v.center = CGPointMake(50, 50);
        [self.view addSubview:v];

        _circleView = v;
    }
    return _circleView;
}
- (instancetype) initWithTitle:(NSString *)title color:(UIColor *)color {
    if (self = [super init]) {
        self.title = title;
        self.circleView.backgroundColor = color;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction * action1 = [UIPreviewAction actionWithTitle:@"1" style:1 handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

    }];
    
    UIPreviewAction * action2 = [UIPreviewAction actionWithTitle:@"2" style:0 handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {

    }];
    UIPreviewAction * action3 = [UIPreviewAction actionWithTitle:@"3" style:2 handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    NSArray * actions = @[action1,action2,action3];
    
    return actions;
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
