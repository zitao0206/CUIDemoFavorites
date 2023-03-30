//
//  CUIDemoCellItemModel.h
//  CUIUIKit_Example
//
//  Created by zitao on 03/30/2021.
//  Copyright (c) 2021 zitao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CUIDemoItemCellType) {
    ImageItemCellType, //展示图片或者gif
    VideoItemCellType, //展示mp4视频
};

@interface CUIDemoCellItemModel : NSObject

@property (nonatomic, assign) CUIDemoItemCellType cellType;
@property (nonatomic, copy) NSString *className; //控件类名
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *imageType;//mp4
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *detailVCName; //测试代码的VC
@property (nonatomic, copy) NSString *descrip; //说明

@end


NS_ASSUME_NONNULL_END
