//
//  CUIElementsCell.swift
//  CUIDemoFavorites
//
//  Created by zitao0206 on 2023/3/31.
//  Copyright © 2023 zitao0206. All rights reserved.
//

import Foundation
import UIKit
import CUIDemoExamples

class CUIElementsCell: UICollectionViewCell {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        // 创建 imageView 子视图
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // 创建并添加 titleLabel 子视图
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 15))
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textAlignment = .left
        addSubview(titleLabel)
        
        // 创建并添加 subtitleLabel 子视图
        subtitleLabel = UILabel(frame: CGRect(x: 0, y: contentView.frame.height - 15, width: frame.size.width, height: 15))
        subtitleLabel.textColor = .cyan
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textAlignment = .right
        
        addSubview(subtitleLabel)
        
    }
    
    public func refreshData(_ data: Any) {
        
        guard let item = data as? CUIDemoCellItemModel else {
            return
        }
        titleLabel.text = item.className
        subtitleLabel.text = item.descrip
        guard let bundle = Bundle.ako_bundle(withPodName: "CUIDemoExamples") else {
            assertionFailure("Image resource exception！-------> \(item.imageName)")
            return
        }
        guard let image = UIImage(named: item.imageName, in: bundle, compatibleWith: nil) else {
            assertionFailure("Image resource exception！-------> \(item.imageName)")
            return
        }
        imageView.image = image
        setNeedsLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 15)
        subtitleLabel.frame = CGRect(x: 0, y: contentView.frame.height - 15, width: frame.size.width, height: 15)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
