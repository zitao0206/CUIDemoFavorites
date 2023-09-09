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
        array.append(obtainItemData(withKeyName: "MultiLabel", descrip: "Multi label･UIKit", imageType: "png"))
        array.append(obtainItemData(withKeyName: "TabSelect", descrip: "Tab selection･UIKit", imageType: "png"))
        return array
    }

    static func obtainItemData(withKeyName keyName: String, descrip description: String, imageType: String) -> CUIDemoItemModel {
//        let className = "\(keyName)View"
//        let imageName = "\(keyName.lowercased())"
//        let detailVCName = "\(keyName)ViewVC"
//
//        let item = CUIDemoCellItemModel()
//        item.imageType = imageType
//        if imageType == "mp4" {
//            item.cellType = .VideoItemCellType
//        } else {
//            item.cellType = .ImageItemCellType
//        }
//        item.className = className
//        item.imageName = imageName
//        item.detailVCName = detailVCName
//        item.detailVC = detailVCName.obtainObj() as? UIViewController
//        item.descrip = description
//        return item
        
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
