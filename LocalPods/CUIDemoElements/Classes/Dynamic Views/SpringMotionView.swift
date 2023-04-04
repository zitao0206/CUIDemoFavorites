//
//  SpringMotionView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/4/4.
//

import Foundation
import UIKit

public class SpringMotionView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: bounds)
        view.clipsToBounds = true
        return view
    }()

    private lazy var leftHeadBgView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.backgroundColor = .white
        let image = UIImage(named: "cui_mahuateng")!
        leftHeadImageView = UIImageView(image: image)
        leftHeadImageView.frame.size = CGSize(width: 60, height: 60)
        leftHeadImageView.layer.cornerRadius = 60 / 2.0
        leftHeadImageView.layer.masksToBounds = true
        leftHeadImageView.backgroundColor = .clear
        view.layer.cornerRadius = 64 / 2.0
        view.layer.masksToBounds = true
        view.addSubview(leftHeadImageView)
        view.isHidden = true
        return view
    }()
    private var leftHeadImageView: UIImageView!

    private lazy var rightHeadBgView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.backgroundColor = .white
        let image = UIImage(named: "cui_mayun")!
        rightHeadImageView = UIImageView(image: image)
        rightHeadImageView.frame.size = CGSize(width: 60, height: 60)
        rightHeadImageView.layer.cornerRadius = 60 / 2.0
        rightHeadImageView.layer.masksToBounds = true
        rightHeadImageView.backgroundColor = .clear
        view.layer.cornerRadius = 64 / 2.0
        view.layer.masksToBounds = true
        view.addSubview(rightHeadImageView)
        view.isHidden = true
        return view
    }()
    private var rightHeadImageView: UIImageView!

    private lazy var beginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(showWithAnimation), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        button.setTitle("点击开始", for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentView.addSubview(rightHeadBgView)
        contentView.addSubview(leftHeadBgView)
        contentView.addSubview(beginBtn)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func showWithAnimation() {
        leftHeadBgView.isHidden = false
        rightHeadBgView.isHidden = false
        leftHeadBgView.frame.origin.x = -leftHeadBgView.frame.size.width
        rightHeadBgView.frame.origin.x = contentView.frame.size.width
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [.curveEaseInOut], animations: {
            self.leftHeadBgView.frame.origin.x = (self.contentView.frame.size.width - self.leftHeadBgView.frame.size.width * 2 + 10) / 2.0
            self.rightHeadBgView.frame.origin.x = self.leftHeadBgView.frame.maxX - 10
        }, completion: nil)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        
        beginBtn.sizeToFit()
        beginBtn.frame.origin.y = 0
        beginBtn.center.x = bounds.size.width / 2.0
        
        leftHeadBgView.center.y = bounds.size.height / 2.0
        leftHeadImageView.frame.origin.x = 2
        leftHeadImageView.frame.origin.y = 2
        
        rightHeadBgView.center.y = bounds.size.height / 2.0
        rightHeadImageView.frame.origin.x = 2
        rightHeadImageView.frame.origin.y = 2
        
        leftHeadBgView.frame.origin.x = -leftHeadBgView.frame.size.width
        rightHeadBgView.frame.origin.x = bounds.size.width
    }

}
