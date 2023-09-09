//
//  CUIDemoCellItemModel.swift
//  CUIDemoExamples
//
//  Created by lizitao on 2023/9/9.
//

import Foundation

enum CUIDemoItemType {
    case imageItemType // Show image or gif
    case videoItemType // Show mp4
}

struct CUIDemoItemModel {
    var cellType: CUIDemoItemType
    var className: String // control class name
    var imageName: String
    var imageType: String // mp4, png
    var author: String
    var detailVCName: String // VC for test code
    var detailVC: UIViewController? // VC for test code
    var descrip: String // description
}
