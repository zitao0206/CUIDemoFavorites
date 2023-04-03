//
//  CommonViewVC.swift
//  CUIDemoExamples
//
//  Created by zitao0206 on 2023/3/31.
//

import UIKit
import SwiftUI

public class CommonViewVC<T: View>: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let rootView = loadContentView()
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
    
//    func loadContentView() -> AnyView {
//        fatalError("loadContentView() has not been implemented!!!")
//    }
    
    func loadContentView() -> T {
        fatalError("loadContentView() has not been implemented")
    }

}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

 
