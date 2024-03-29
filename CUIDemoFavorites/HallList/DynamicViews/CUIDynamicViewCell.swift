//
//  CUIDynamicViewCell.swift
//  CUIDemoFavorites
//
//  Created by zitao0206 on 2023/3/31.
//  Copyright © 2023 zitao0206. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import CUIDemoExamples

class CUIDynamicViewCell: UICollectionViewCell {
    private var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = UIColor.white.withAlphaComponent(1.0)
    label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    return label
    }()
    
    private var classLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.white.withAlphaComponent(1.0)
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return label
    }()

    private var player: AVPlayer? // player object
    private var currentPlayerItem: AVPlayerItem?
    
    var isBeingPaused : Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(classLabel)
        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayDidEnd), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.3)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: 0, width: titleLabel.bounds.width, height: titleLabel.bounds.height)
        classLabel.frame = CGRect(x: contentView.bounds.width - classLabel.bounds.width, y: contentView.bounds.height - classLabel.bounds.height, width: classLabel.bounds.width, height: classLabel.bounds.height)
    }

    func refreshData(_ data: Any?) {
        if let item = data as? CUIDemoItemModel {
            
            if item.cellType != .videoItemType {
                return
            }
            
            titleLabel.text = item.className
            titleLabel.sizeToFit()
            classLabel.text = item.descrip
            classLabel.sizeToFit()
            
            // the path of local video
            guard let bundle = Bundle.ako_bundle(withPodName: "CUIDemoExamples-Videos") else {
                assertionFailure("Video Resource Exception ！！！")
                return
            }
            guard let localFilePath = bundle.path(forResource: item.imageName, ofType: item.imageType), !localFilePath.isEmpty else {
                assertionFailure("Video Resource Exception ！！！")
                return
            }
            
            let localVideoUrl = URL(fileURLWithPath: localFilePath)
            guard localVideoUrl.path.count > 0 else {
                assertionFailure("Video Resource Exception ！！！")
                return
            }
            
            let playerItem = AVPlayerItem(url: localVideoUrl)
            currentPlayerItem = playerItem
            player = AVPlayer(playerItem: playerItem)
            let avLayer = AVPlayerLayer(player: player)
            avLayer.videoGravity = .resizeAspect
            avLayer.frame = contentView.bounds
            contentView.layer.addSublayer(avLayer)
            
            contentView.bringSubviewToFront(titleLabel)
            contentView.bringSubviewToFront(classLabel)

            startAnimation()
            
            setNeedsLayout()
        }
    }

    @objc private func moviePlayDidEnd(_ notification: Notification) {
        if let item = notification.object as? AVPlayerItem {
            if !isBeingPaused {
                item.seek(to: CMTime.zero, completionHandler: nil)
                player?.play()
            }
        }
    }
    
    func startAnimation() {
        isBeingPaused = false
        player?.play()
    }
    
    func stopAnimation() {
        isBeingPaused = true
        player?.pause()
    }
}


