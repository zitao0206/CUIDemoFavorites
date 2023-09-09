//
//  CUIDemoElementsData.swift
//  CUIDemoExamples
//
//  Created by lizitao on 2023/9/9.
//

import Foundation

public class CUIDemoElementsData : NSObject {
    
    public static func obtainData() -> [CUIDemoItemModel] {
        var array = [CUIDemoItemModel]()
        //图片像素比例：1116 * 594
        array.append(obtainItemData(withKeyName: "SimpleTab", descrip: "Simple Tab Selection･SwiftUI", imageType: "mov"))

        array.append(obtainItemData(withKeyName: "SimpleSlider", descrip: "Simple Slider･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleTextEditor", descrip: "Simple TextEditor･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleTextField", descrip: "Simple TextField･SwiftUI", imageType: "mov"))

        array.append(obtainItemData(withKeyName: "SimpleContextMenu", descrip: "Simple ContextMenu･SwiftUI", imageType: "mov"))

        array.append(obtainItemData(withKeyName: "SimpleActionSheet", descrip: "Simple ActionSheet･SwiftUI", imageType: "mov"))

        array.append(obtainItemData(withKeyName: "SimpleAlert", descrip: "Simple Alert･SwiftUI", imageType: "png"))

        array.append(obtainItemData(withKeyName: "SimpleNavigation", descrip: "Simple Navigation Bar･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleSheets", descrip: "Simple Sheets Control･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleTransition", descrip: "Simple Transition Animations･SwiftUI", imageType: "mov"))
        array.append(obtainItemData(withKeyName: "SimpleRotation", descrip: "Simple Rotation Animation･SwiftUI", imageType: "mov"))

        array.append(obtainItemData(withKeyName: "SimpleList", descrip: "Simple List･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleScrollView", descrip: "Simple ScrollView･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleShapes", descrip: "Simple Shapes･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleGradient", descrip: "Simple Gradient Background･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleLine", descrip: "Simple Line･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimpleButton", descrip: "Simple Button･SwiftUI", imageType: "png"))
        array.append(obtainItemData(withKeyName: "SimplePicker", descrip: "Simple Picker･SwiftUI", imageType: "png"))

       
        
        return array
    }

    static func obtainItemData(withKeyName keyName: String, descrip description: String, imageType: String) -> CUIDemoItemModel {
//        let className = "\(keyName)View"
//        let imageName = "\(keyName.lowercased())"
//        let detailVCName = "\(keyName)ViewVC"
//        let item = CUIDemoCellItemModel()
//        item.className = className
//        item.imageName = imageName
//        item.imageType = imageType
//        if imageType == "png" {
//            item.cellType = .ImageItemCellType
//        } else {
//            item.cellType = .VideoItemCellType
//        }
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
