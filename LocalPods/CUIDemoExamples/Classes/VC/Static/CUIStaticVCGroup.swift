//
//  CUIStaticVCGroup.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/9/24.
//

import Foundation
import SwiftUI
import CUIDemoElements


@objc(LineChartViewVC)
public class LineChartViewVC: SwiftUIViewVC <LineChartView> {
    public override func loadContentView() -> LineChartView {
        return LineChartView()
    }
}

@objc(BezierShapesViewVC)
public class BezierShapesViewVC: SwiftUIViewVC <BezierShapesView> {
    public override func loadContentView() -> BezierShapesView {
        return BezierShapesView()
    }
}

@objc(ShrinkingShapesViewVC)
public class ShrinkingShapesViewVC: SwiftUIViewVC <ShrinkingShapesView> {
    public override func loadContentView() -> ShrinkingShapesView {
        return ShrinkingShapesView()
    }
}


