//
//  CUIDemoStaticViewData.swift
//  CUIDemoExamples
//
//  Created by lizitao on 2023/9/9.
//

import Foundation

public class CUIDemoStaticViewData : NSObject {
    
    public static func obtainData() -> [CUIDemoCellItemModel] {
        var array = [CUIDemoCellItemModel]()
        array.append(obtainItemData(withKeyName: "MultiLabel", descrip: "多标签展示･UIKit", imageType: "png"))
        array.append(obtainItemData(withKeyName: "TabSelect", descrip: "分段选择･UIKit", imageType: "png"))
        return array
    }

    static func obtainItemData(withKeyName keyName: String, descrip description: String, imageType: String) -> CUIDemoCellItemModel {
        let className = "CUI\(keyName)View"
        let imageName = "\(keyName.lowercased())"
        let detailVCName = "CUI\(keyName)ViewVC"
        let item = CUIDemoCellItemModel()
        item.imageType = imageType
        if imageType == "mp4" {
            item.cellType = .VideoItemCellType
        } else {
            item.cellType = .ImageItemCellType
        }
        item.className = className
        item.imageName = imageName
        item.detailVCName = detailVCName
        item.detailVC = detailVCName.obtainObj() as? UIViewController
        item.descrip = description
        return item
    }

}
