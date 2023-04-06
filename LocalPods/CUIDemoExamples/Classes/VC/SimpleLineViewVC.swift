//
//  SimpleLineViewVC.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/4/5.
//

import UIKit
import SwiftUI
import CUIDemoElements

@objc(SimpleLineViewVC)
public class SimpleLineViewVC: SwiftUIViewVC <SimpleLineView> {
    
    public override func loadContentView() -> SimpleLineView {
        return SimpleLineView()
    }
    
}
