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
public class SimplePickerViewVC: CommonViewVC {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let rootView = SimplePickerView()
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController)
        view.addSubview(hostingController.view)

        hostingController.didMove(toParent: self)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}



