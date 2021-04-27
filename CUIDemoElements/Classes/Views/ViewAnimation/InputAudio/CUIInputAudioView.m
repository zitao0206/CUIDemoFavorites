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
      
        CUIOCTest *t =  [[CUIOCTest alloc] init];
        [t show];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end

