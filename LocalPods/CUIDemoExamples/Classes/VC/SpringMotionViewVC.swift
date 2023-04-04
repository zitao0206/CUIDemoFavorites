//
//  SpringMotionViewVC.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/4/4.
//

import UIKit
import SwiftUI
import CUIDemoElements
import AKOCommonToolsKit

@objc(SpringMotionViewVC)
public class SpringMotionViewVC: UIViewController {
    
    var springMotionView: SpringMotionView?
      
    public override func viewDidLoad() {
          super.viewDidLoad()
          let springMotionView = loadContentView()
 
          view.addSubview(springMotionView)
          springMotionView.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
          self.springMotionView = springMotionView
          view.backgroundColor = UIColor.white
    }
    
    func loadContentView() -> SpringMotionView {
        return SpringMotionView()
    }
      
    public override func viewWillLayoutSubviews() {
          super.viewWillLayoutSubviews()
          springMotionView?.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
          springMotionView?.centerX = view.centerX
          springMotionView?.top = 200
    }
    
}
