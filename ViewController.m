//
//  ViewController.m
//  AnimationVSCADisplayLink
//
//  Created by wangtao on 2018/5/16.
//  Copyright © 2018年 wangtao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UIView *animationView;
@property (nonatomic, strong)CADisplayLink *displayLink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.animationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animationView];
}

- (IBAction)beginBtnClick:(id)sender {
    [self showAnimation];
}

- (void)showAnimation {
    self.animationView.frame = CGRectMake(0, 0, 200, 200);
    [UIView animateWithDuration:1 animations:^{
        self.animationView.frame = CGRectMake(0, self.view.frame.size.height, 200, 200);
    } completion:^(BOOL finished) {
        [self showAnimation];
    }];
}

static int count = 0;
- (void)updateLocation {
    count++;
    CGFloat top = count* self.view.frame.size.height/60;
    self.animationView.frame = CGRectMake(0, top, 200, 200);

    if (count == 60) {
        count = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
