//
//  CUIInputAudioView.m
//  Pods
//
//  Created by Leon on 07/04/2021.
//

#import "CUIInputAudioView.h"
#import <CUIDemoElements/CUIDemoElements-Swift.h>

@interface CUIInputAudioView ()
@property (nonatomic, strong) CUIRecordButton *recordBtn;

@end

@implementation CUIInputAudioView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CUIRecordButton *recordBtn = [[CUIRecordButton alloc]init];
        recordBtn.size = CGSizeMake(frame.size.width, 40);
        recordBtn.layer.cornerRadius = 20;
        recordBtn.layer.masksToBounds = true;
        recordBtn.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
        [self addSubview:recordBtn];
        self.recordBtn = recordBtn;
        [self addRecordBtnAction];
    }
    return self;
}

- (void)addRecordBtnAction
{
    __weak typeof(self) weakSelf = self;
    self.recordBtn.shouldBeginAction = ^BOOL(CUIRecordButton * _Nonnull button) {
        return true;
    };
    self.recordBtn.beginAction = ^(CUIRecordButton * _Nonnull button) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [CUIRecordIndicator showWithStatus:StatusRecording onView:strongSelf];
    };
    self.recordBtn.recordingAction = ^(CUIRecordButton * _Nonnull button) {
      
    };
    self.recordBtn.cancelingAction = ^(CUIRecordButton * _Nonnull button) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [CUIRecordIndicator showWithStatus:StatusCancel onView:strongSelf];
    };
    self.recordBtn.cancelAction = ^(CUIRecordButton * _Nonnull button) {
        [CUIRecordIndicator dismiss];
    };
    self.recordBtn.finishAction = ^(CUIRecordButton * _Nonnull button) {
        [CUIRecordIndicator dismissWithoutDelay];
    };
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.recordBtn.size = CGSizeMake(self.width, 40);
    self.recordBtn.left = 0;
    self.recordBtn.bottom = self.height;
}

@end

