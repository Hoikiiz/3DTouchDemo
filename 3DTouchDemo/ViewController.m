//
//  ViewController.m
//  3DTouchDemo
//
//  Created by WeiCheng—iOS_1 on 16/1/14.
//  Copyright © 2016年 WeiCheng—iOS_1. All rights reserved.
//

#import "ViewController.h"
#import "TouchViewController.h"
@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) UIView *touchView;
@property (weak, nonatomic) IBOutlet UILabel *forceLab;

@end

@implementation ViewController

- (UIView *)touchView {
    if (!_touchView) {
        UIView *v = [[UIView alloc] init];
        [self.view addSubview:v];
        v.backgroundColor = [UIColor colorWithRed:0 green:0.75 blue:0.75 alpha:1];
        v.frame = CGRectMake(0, 0, 200, 200);
        v.center = self.view.center;
        v.layer.cornerRadius = 100;
        _touchView = v;
    }
    return _touchView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self check3DTouch];
    [self registerForPreviewingWithDelegate:self sourceView:self.touchView];
}

-(void)check3DTouch
{
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"ok");
    }
    else{
        NSLog(@"not ok");
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if ([touch respondsToSelector:@selector(force)]) {
        NSString *str = [NSString stringWithFormat:@"Power : %.0f",touch.force * 100];
        self.forceLab.text = str;
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *str = [self.forceLab.text stringByReplacingCharactersInRange:NSMakeRange(0, 8) withString:@""];
    NSInteger power = str.integerValue;
    for (; power > -1 ; power --) {
            NSString *s = [NSString stringWithFormat:@"Power : %ld",power];
            self.forceLab.text = s;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    TouchViewController *vc = [[TouchViewController alloc] initWithTitle:@"1" color:[UIColor cyanColor]];
    vc.preferredContentSize = CGSizeMake(100, 100);
    return vc;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}
@end
