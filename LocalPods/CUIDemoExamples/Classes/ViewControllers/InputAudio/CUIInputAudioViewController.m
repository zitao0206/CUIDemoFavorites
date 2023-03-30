//
//  CUIInputAudioViewController.m
//  Pods
//
//  Created by zitao on 04/02/2021.
//

#import "CUIInputAudioViewController.h"
#import "CUIInputAudioView.h"

@interface CUIInputAudioViewController ()
@property(nonatomic, strong) CUIInputAudioView *inputAudioView;

@end

@implementation CUIInputAudioViewController

 - (void)viewDidLoad
{
    [super viewDidLoad];
    CUIInputAudioView *inputAudioView = [[CUIInputAudioView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 100)];
    [self.view addSubview:inputAudioView];
    inputAudioView.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.3];
    self.inputAudioView = inputAudioView;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.inputAudioView.left = 0;
    self.inputAudioView.top = 0;
}

@end

