//
//  SimpleButtonViewVC.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/4/6.
//

import Foundation
import SwiftUI
import CUIDemoElements

@objc(SimpleButtonViewVC)
public class SimpleButtonViewVC: SwiftUIViewVC <SimpleButtonView> {
    
    public override func loadContentView() -> SimpleButtonView {
        return SimpleButtonView()
    }
    
}
