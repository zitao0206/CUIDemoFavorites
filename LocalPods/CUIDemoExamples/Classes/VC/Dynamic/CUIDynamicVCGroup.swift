//
//  CUIVCGroup.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/5/1.
//

import Foundation
import SwiftUI
import CUIDemoElements

@objc(PhaseTrafficLightViewVC)
public class PhaseTrafficLightViewVC: SwiftUIViewVC <PhaseTrafficLightView> {
    public override func loadContentView() -> PhaseTrafficLightView {
        return PhaseTrafficLightView()
    }
}





