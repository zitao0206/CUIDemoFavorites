//
//  CUIVCGroup.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023/5/1.
//

import Foundation
import SwiftUI
import CUIDemoElements

@objc(SimpleListViewVC)
public class SimpleListViewVC: SwiftUIViewVC <SimpleListView> {
    
    public override func loadContentView() -> SimpleListView {
        return SimpleListView()
    }
}

@objc(SimpleScrollViewVC)
public class SimpleScrollViewVC: SwiftUIViewVC <SimpleScrollView> {
    
    public override func loadContentView() -> SimpleScrollView {
        return SimpleScrollView()
    }
}

@objc(SimpleButtonViewVC)
public class SimpleButtonViewVC: SwiftUIViewVC <SimpleButtonView> {
    
    public override func loadContentView() -> SimpleButtonView {
        return SimpleButtonView()
    }
}

@objc(SimplePickerViewVC)
public class SimplePickerViewVC: SwiftUIViewVC <SimplePickerView> {
    
    public override func loadContentView() -> SimplePickerView {
        return SimplePickerView()
    }
}

@objc(SimpleGradientViewVC)
public class SimpleGradientViewVC: SwiftUIViewVC <SimpleGradientView> {
    
    public override func loadContentView() -> SimpleGradientView {
        return SimpleGradientView()
    }
}

@objc(SimpleLineViewVC)
public class SimpleLineViewVC: SwiftUIViewVC <SimpleLineView> {
    
    public override func loadContentView() -> SimpleLineView {
        return SimpleLineView()
    }
}

@objc(SimpleShapeViewVC)
public class SimpleShapeViewVC: SwiftUIViewVC <SimpleShapeView> {
    
    public override func loadContentView() -> SimpleShapeView {
        return SimpleShapeView()
    }
}




