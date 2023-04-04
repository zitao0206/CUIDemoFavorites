//
//  SimplePickerViewVC.swift
//  CUIDemoExamples
//
//  Created by zitao on 2023/3/31.
//

import UIKit
import SwiftUI
import CUIDemoElements

@objc(SimplePickerViewVC)
public class SimplePickerViewVC: SwiftUIViewVC <SimplePickerView> {
    
 
    public override func loadContentView() -> SimplePickerView {
        return SimplePickerView()
    }
    
    
}
















