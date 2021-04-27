//
//  CUIInputAudioView.m
//  Pods
//
//  Created by Leon on 07/04/2021.
//

#import "CUIInputAudioView.h"
#import <CUIDemoElements/CUIDemoElements-Swift.h>

@interface CUIInputAudioView ()
 
@end

@implementation CUIInputAudioView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        UIImage *image = CUIImageNamed(@"");
        UIImage *image1 = [UIImage cui_imageWithColor:[UIColor redColor]];
        [UIColor cui_colorWithHex:0x333333];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end

