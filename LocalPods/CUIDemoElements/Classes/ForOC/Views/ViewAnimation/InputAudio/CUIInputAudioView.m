//
//  CUIInputAudioView.m
//  Pods
//
//  Created by zitao on 07/04/2021.
//

#import "CUIInputAudioView.h"
#import <CUIDemoElements/CUIDemoElements-Swift.h>

@interface CUIInputAudioView ()
@property (nonatomic, strong) CUIRecordButton *recordBtn;
@property (nonatomic, strong) NSDate *beginDate;
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
        strongSelf.beginDate = [NSDate date];
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
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        [CUIRecordIndicator dismissWithoutDelay];
        NSTimeInterval start = [self.beginDate timeIntervalSince1970] * 1000;
        NSTimeInterval end = [[NSDate date]timeIntervalSince1970] *1000;
        NSTimeInterval time = end - start;
        if (time / 1000.0 < 1.0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [CUIRecordIndicator showWithStatus:StatusTooShort onView:strongSelf];
            });
        }
      
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

