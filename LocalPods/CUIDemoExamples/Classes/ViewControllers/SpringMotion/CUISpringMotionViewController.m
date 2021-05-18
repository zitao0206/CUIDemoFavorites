//
//  CUISpringMotionViewController.m
//  Pods
//
//  Created by Leon on 04/02/2021.
//

#import "CUISpringMotionViewController.h"
#import "CUISpringMotionView.h"

@interface CUISpringMotionViewController ()
@property(nonatomic, strong) CUISpringMotionView *springMotionView;

@end

@implementation CUISpringMotionViewController 

 - (void)viewDidLoad
{
    [super viewDidLoad];
    CUISpringMotionView *springMotionView = [[CUISpringMotionView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    [self.view addSubview:springMotionView];
    springMotionView.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.3];
    self.springMotionView = springMotionView;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.springMotionView.centerX = self.view.centerX;
    self.springMotionView.top = 200;
}

@end

