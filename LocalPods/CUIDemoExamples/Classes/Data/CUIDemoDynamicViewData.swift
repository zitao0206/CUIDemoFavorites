//
//  CUIDemoData.swift
//  CUIDemoExamples
//
//  Created by zitao on 2023/3/31.
//

import Foundation
import AKOCommonToolsKit

public class CUIDemoDynamicViewData : NSObject {
    
    public static func obtainData() -> [CUIDemoItemModel] {
        var array = [CUIDemoItemModel]()
        
        array.append(obtainItemData(withKeyName: "PhaseTrafficLight", descrip: "SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SpringMotion", descrip: "UIKit", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleRotation", descrip: "UIKit", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "RollingNumber", descrip: "UIKit", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "GravityCollision", descrip: "UIKit", imageType: "mov"))
        

//        [array addObject:[self.class obtainItemDataWithKeyName:@"ProgressCircle" descrip:@"简易的圆形进度条"]];
//        [array addObject:[self.class obtainItemDataWithKeyName:@"InputAudio" descrip:@"语音聊天输入动画"]];
   
        return array
    }

    static func obtainItemData(withKeyName keyName: String, descrip description: String, imageType: String) -> CUIDemoItemModel {
        let classNameForModel = "\(keyName)View"
        let imageNameForModel = "\(keyName.lowercased())"
        let detailVCNameForModel = "\(keyName)ViewVC"
        let imageTypeForModel = imageType
        var cellTypeForModel : CUIDemoItemType = .imageItemType
        if imageType == "mov" || imageType == "mp4" {
            cellTypeForModel = .videoItemType
        }
        let descriptionForModel = description
        
        let itemModel = CUIDemoItemModel(cellType: cellTypeForModel, className: classNameForModel, imageName: imageNameForModel, imageType: imageTypeForModel, author: "", detailVCName: detailVCNameForModel, descrip: descriptionForModel)
        return itemModel
    }

}
