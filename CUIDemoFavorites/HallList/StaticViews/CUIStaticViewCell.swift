//
//  CUIElementsCell.swift
//  CUIDemoFavorites
//
//  Created by zitao0206 on 2023/09/08.
//  Copyright © 2023 zitao0206. All rights reserved.
//

import Foundation
import UIKit
import CUIDemoExamples

class CUIStaticViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        // 创建 imageView 子视图
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        // 创建并添加 titleLabel 子视图
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 15))
        titleLabel.textColor = .white.withAlphaComponent(1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = .black.withAlphaComponent(0.5)
        addSubview(titleLabel)
        
        // 创建并添加 subtitleLabel 子视图
        subtitleLabel = UILabel(frame: CGRect(x: 0, y: contentView.frame.height - 15, width: frame.size.width, height: 15))
        subtitleLabel.textColor = .white.withAlphaComponent(1.0)
        subtitleLabel.font = UIFont.systemFont(ofSize: 15)
        subtitleLabel.textAlignment = .right
        subtitleLabel.backgroundColor = .black.withAlphaComponent(0.5)
        
        addSubview(subtitleLabel)
        
    }
    
    public func refreshData(_ data: Any) {
        
        guard let item = data as? CUIDemoCellItemModel else {
            return
        }
        if item.cellType != .ImageItemCellType {
            return
        }
        titleLabel.text = item.descrip
        subtitleLabel.text = item.className
        guard let bundle = Bundle.ako_bundle(withPodName: "CUIDemoExamples-Images") else {
            assertionFailure("Image resource exception！-------> \(item.imageName)")
            return
        }
      
        guard let localFilePath = bundle.path(forResource: item.imageName, ofType: item.imageType) else {
            assertionFailure("Image resource exception！-------> \(item.imageName)")
            return
        }
        
        guard let image = UIImage(contentsOfFile: localFilePath) else {
            assertionFailure("Image resource exception！-------> \(item.imageName)")
            return
        }
        
        imageView.image = image
        setNeedsLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        titleLabel.sizeToFit()
        
        subtitleLabel.sizeToFit()
        subtitleLabel.right = frame.size.width
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
