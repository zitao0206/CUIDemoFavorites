//
//  CommonViewVC.swift
//  CUIDemoExamples
//
//  Created by zitao0206 on 2023/3/31.
//

import UIKit
import SwiftUI

public class SwiftUIViewVC<T: View>: UIViewController {
    
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
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: -100),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        view.backgroundColor = loadBackgroudColor()
    }
    
    public func loadContentView() -> T {
        fatalError("loadContentView() has not been implemented")
    }
    
    public func loadBackgroudColor() -> UIColor {
        return .white
    }
    
 
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

 
