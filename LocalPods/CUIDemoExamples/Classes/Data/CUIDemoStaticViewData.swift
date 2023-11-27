//
//  CUIDemoStaticViewData.swift
//  CUIDemoExamples
//
//  Created by lizitao on 2023/9/9.
//

import Foundation

public class CUIDemoStaticViewData : NSObject {
    
    public static func obtainData() -> [CUIDemoItemModel] {
        var array = [CUIDemoItemModel]()
        //Recommended image ratio: 1200 * 600
        array.append(obtainItemData(withKeyName: "LineChart", descrip: "SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "BezierShapes", descrip: "SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "ShrinkingShapes", descrip: "SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "MultiLabel", descrip: "UIKit", imageType: "png"))
        array.append(obtainItemData(withKeyName: "TabSelect", descrip: "UIKit", imageType: "png"))
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
