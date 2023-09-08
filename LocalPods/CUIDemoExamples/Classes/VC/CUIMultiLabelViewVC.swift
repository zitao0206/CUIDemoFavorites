//
//  CUIMultiLabelViewVC.swift
//  CUIDemoExamples
//
//  Created by zitao0206 on 2023/9/8.
//

import Foundation
import SwiftUI
import CUIDemoElements

@objc(CUIMultiLabelViewVC)
public class CUIMultiLabelViewVC: UIViewController {
    
    private lazy var multiLabelView1: CUIMultiLabelView = {
        let config: (CUIMultiLabelConfig) -> Void = { config in
               config.width = 0
               config.templateLabel.textAlignment = .center
               config.templateLabel.textColor = .white
               config.templateLabel.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
               config.templateLabel.backgroundColor = UIColor.white.withAlphaComponent(0.2)
               config.templateLabel.layer.cornerRadius = 11
               config.templateLabel.clipsToBounds = true
               config.templateHeight = 22
               config.backgroundColor = UIColor.black.withAlphaComponent(0.8)
               config.topSpace = 0
               config.leftSpace = 0
               config.additionalWidth = 14
               config.numberOflines = 1
           }

        let multiLabelView = CUIMultiLabelView(config: config)
            return multiLabelView
        }()

        private lazy var multiLabelView2: CUIMultiLabelView = {
            let config: (CUIMultiLabelConfig) -> Void = { config in
                config.width = 200
                config.templateLabel.textAlignment = .center
                config.templateLabel.textColor = .white
                config.templateLabel.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
                config.templateLabel.backgroundColor = UIColor.white.withAlphaComponent(0.2)
                config.templateLabel.layer.cornerRadius = 11
                config.templateLabel.clipsToBounds = true
                config.templateHeight = 22
                config.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                config.topSpace = 0
                config.leftSpace = 0
                config.additionalWidth = 14
                config.numberOflines = 0
            }

            let multiLabelView = CUIMultiLabelView(config: config)
            return multiLabelView
        }()
    
    public override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

            view.addSubview(multiLabelView1)
            let arr1 = ["杭州", "上海", "北京"]
            multiLabelView1.refreshDataArray(arr1)

            view.addSubview(multiLabelView2)
            let arr2 = ["杭州", "上海", "北京", "南京", "乌鲁木齐", "哈尔滨", "合肥", "绍兴", "重庆", "昆明", "天津"]
            multiLabelView2.refreshDataArray(arr2)
        }

    public override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()

            multiLabelView1.center.x = view.center.x
            multiLabelView1.frame.origin.y = 200

            multiLabelView2.center.x = view.center.x
            multiLabelView2.frame.origin.y = 250
        }
}

//@objc(SimpleSliderViewVC)
//public class SimpleSliderViewVC: SwiftUIViewVC <SimpleSliderView> {
//    public override func loadContentView() -> SimpleSliderView {
//        return SimpleSliderView()
//    }
//}


