//
//  CUIDemoElementsData.swift
//  CUIDemoExamples
//
//  Created by lizitao on 2023/9/9.
//

import Foundation

public class CUIDemoElementsData : NSObject {
    
    public static func obtainData() -> [CUIDemoCellItemModel] {
        var array = [CUIDemoCellItemModel]()
        //图片像素比例：1116 * 594
        array.append(obtainItemData(withKeyName: "SimpleTab", descrip: "简单的Tab选择･SwiftUI", imageType: "mov"))
        
        array.append(obtainItemData(withKeyName: "SimpleSlider", descrip: "简单的Slider･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleTextEditor", descrip: "简单的TextEditor･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleTextfield", descrip: "简单的Textfield･SwiftUI", imageType: "mov"))
        
        array.append(obtainItemData(withKeyName: "SimpleContextMenu", descrip: "简单的ContextMenu･SwiftUI", imageType: "mov"))
        
        array.append(obtainItemData(withKeyName: "SimpleActionSheet", descrip: "简单的ActionSheet･SwiftUI", imageType: "mov"))
        
        array.append(obtainItemData(withKeyName: "SimpleAlert", descrip: "简单的Alert･SwiftUI", imageType: "png"))
        
        array.append(obtainItemData(withKeyName: "SimpleNavigation", descrip: "简单的导航栏･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleSheets", descrip: "简单的Sheets控件･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleTransition", descrip: "简单的Transition动画･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleRotation", descrip: "简单的旋转动画･SwiftUI", imageType: "mov"))
        
        
        array.append(obtainItemData(withKeyName: "SimpleList", descrip: "简单的列表･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleScroll", descrip: "简单的滚动视图･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleShape", descrip: "简单的图形･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleGradient", descrip: "简单的渐变背景･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleLine", descrip: "简单的线条･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleButton", descrip: "简单的按钮･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimplePicker", descrip: "简单的选择器･SwiftUI", imageType: "png"))
       
        
        return array
    }

    static func obtainItemData(withKeyName keyName: String, descrip description: String, imageType: String) -> CUIDemoCellItemModel {
        let className = "\(keyName)View"
        let imageName = "\(keyName.lowercased())"
        let detailVCName = "\(keyName)ViewVC"
        let item = CUIDemoCellItemModel()
        item.className = className
        item.imageName = imageName
        item.imageType = imageType
        if imageType == "png" {
            item.cellType = .ImageItemCellType
        } else {
            item.cellType = .VideoItemCellType
        }
        item.detailVCName = detailVCName
        item.detailVC = detailVCName.obtainObj() as? UIViewController
        item.descrip = description
        return item
    }

}
