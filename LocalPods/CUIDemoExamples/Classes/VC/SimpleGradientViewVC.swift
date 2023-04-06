//
//  SimpleGradientViewVC.swift
//  CUIDemoElements
//
//  Created by zitao on 2023/4/6.
//

import Foundation
import SwiftUI
import CUIDemoElements

@objc(SimpleGradientViewVC)
public class SimpleGradientViewVC: SwiftUIViewVC <SimpleGradientView> {
    
    public override func loadContentView() -> SimpleGradientView {
        return SimpleGradientView()
    }
    
}
