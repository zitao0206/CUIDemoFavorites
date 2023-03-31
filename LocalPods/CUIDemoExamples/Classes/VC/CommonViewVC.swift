//
//  CommonViewVC.swift
//  CUIDemoExamples
//
//  Created by lizitao on 2023/3/31.
//

import UIKit
import SwiftUI
import CUIDemoElements

public class CommonViewVC: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = CommonView()
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

public struct CommonView: View {
    public var body: some View {
        Text("Common View")
    }
}

 
