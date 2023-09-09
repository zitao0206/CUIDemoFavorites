//
//  CUIMultiLabelViewVC.swift
//  CUIDemoExamples
//
//  Created by zitao0206 on 2023/9/8.
//

import Foundation
import SwiftUI
import CUIDemoElements
import AKOCommonToolsKit

@objc(CUITabSelectViewVC)
public class CUITabSelectViewVC: UIViewController {
    private lazy var tabSelectView: TabSelectView = {
            let tabSelectView = TabSelectView(frame: CGRect(x: 15, y: 0, width: self.view.frame.width - 30, height: 30))
            tabSelectView.itemColor = UIColor.ako_color(withHexString: "000000", alpha: 0.6)
            tabSelectView.itemWidth = 54
            tabSelectView.itemHeight = 24
            tabSelectView.itemFont = UIFont.boldSystemFont(ofSize: 13.0)
            tabSelectView.itemTextAlignment = .center
            tabSelectView.itemBgColor = .clear
            
            tabSelectView.itemSelectedFont = UIFont.boldSystemFont(ofSize: 15.0)
            tabSelectView.itemSelectedBgColor = UIColor.ako_color(withHexString: "FF3A3A", alpha: 0.5)
            tabSelectView.itemSelectedColor = UIColor.ako_color(withHexString: "FF3B3B")
            tabSelectView.itemSelectedCornerRadius = 12
            
            tabSelectView.tabSelectedCallback { index in
            
            }
            
            tabSelectView.showLineView = true
            tabSelectView.lineColor = .red
            tabSelectView.lineHeight = 4
            tabSelectView.lineCornerRadius = 2
            tabSelectView.lineWidth = 18
            
            return tabSelectView
        }()
        
    public override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
            view.addSubview(tabSelectView)
            let itemArr = ["听听1", "看看2", "点唱3", "互动4", "心动5","新型6","新型7","新型8","新型9","新型10","新型11"]
            tabSelectView.titles = itemArr
            tabSelectView.setupSelectedIndex(0, withCallBack: true)
            tabSelectView.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        }
        
    public override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tabSelectView.frame.origin.y = 200
            tabSelectView.center.x = view.center.x
        }
}



