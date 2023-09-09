//
//  CUIDemoItemModel.swift
//  CUIDemoExamples
//
//  Created by lizitao on 2023/9/9.
//

import Foundation

public enum CUIDemoItemType {
    case imageItemType // Show image or gif
    case videoItemType // Show mp4
}

public struct CUIDemoItemModel {
    public var cellType: CUIDemoItemType
    public var className: String // control class name
    public var imageName: String
    public var imageType: String // mp4, png
    public var author: String
    public var detailVCName: String // VC for test code
    public var descrip: String // description
}
