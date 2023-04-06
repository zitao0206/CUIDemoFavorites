//
//  CUIDemoData.swift
//  CUIDemoExamples
//
//  Created by zitao on 2023/3/31.
//

import Foundation
import AKOCommonToolsKit

public class CUIDemoElementsData : NSObject {
    
    public static func obtainData() -> [CUIDemoCellItemModel] {
        var array = [CUIDemoCellItemModel]()
        //图片像素比例：1115 * 600
        array.append(obtainItemData(withKeyName: "SimpleButton", descrip: "简单的按钮･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleLine", descrip: "简单的线条･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimplePicker", descrip: "简单的选择器･SwiftUI", imageType: "png"))

        return array
    }

    static func obtainItemData(withKeyName keyName: String, descrip description: String, imageType: String) -> CUIDemoCellItemModel {
        let className = "\(keyName)View"
        let imageName = "\(keyName.lowercased())"
        let detailVCName = "\(keyName)ViewVC"
        let item = CUIDemoCellItemModel()
        item.cellType = .ImageItemCellType
        item.className = className
        item.imageName = imageName
        item.imageType = imageType
        item.detailVCName = detailVCName
        item.detailVC = detailVCName.obtainObj() as? UIViewController
        item.descrip = description
        return item
    }

}

public class CUIDemoDynamicViewData : NSObject {
    
    public static func obtainData() -> [CUIDemoCellItemModel] {
        var array = [CUIDemoCellItemModel]()
        array.append(obtainItemData(withKeyName: "SpringMotion", descrip: "弹簧运动动画･UIKit", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SpringMotion", descrip: "弹簧运动动画･UIKit", imageType: "mov"))
        return array
    }

    static func obtainItemData(withKeyName keyName: String, descrip description: String, imageType: String) -> CUIDemoCellItemModel {
        let className = "\(keyName)View"
        let imageName = "\(keyName.lowercased())"
        let detailVCName = "\(keyName)ViewVC"
        let item = CUIDemoCellItemModel()
        item.cellType = .ImageItemCellType
        item.className = className
        item.imageName = imageName
        item.imageType = imageType
        item.detailVCName = detailVCName
        item.detailVC = detailVCName.obtainObj() as? UIViewController
        item.descrip = description
        return item
    }

}
