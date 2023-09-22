//
//  CUIVCGroup.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/5/1.
//

import Foundation
import SwiftUI
import CUIDemoElements

@objc(RefreshLoadMoreViewVC)
public class RefreshLoadMoreViewVC: SwiftUIViewVC <RefreshLoadMoreView> {
    public override func loadContentView() -> RefreshLoadMoreView {
        return RefreshLoadMoreView()
    }
}

@objc(PhaseTrafficLightViewVC)
public class PhaseTrafficLightViewVC: SwiftUIViewVC <PhaseTrafficLightView> {
    public override func loadContentView() -> PhaseTrafficLightView {
        return PhaseTrafficLightView()
    }
}

@objc(CircularProgressViewVC)
public class CircularProgressViewVC: SwiftUIViewVC <CircularProgressView> {
    public override func loadContentView() -> CircularProgressView {
        return CircularProgressView()
    }
}






