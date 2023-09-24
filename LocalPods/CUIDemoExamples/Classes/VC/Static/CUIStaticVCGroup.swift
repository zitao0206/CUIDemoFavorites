//
//  CUIStaticVCGroup.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/9/24.
//

import Foundation
import SwiftUI
import CUIDemoElements

@objc(ShrinkingShapesViewVC)
public class ShrinkingShapesViewVC: SwiftUIViewVC <ShrinkingShapesView> {
    public override func loadContentView() -> ShrinkingShapesView {
        return ShrinkingShapesView()
    }
}


