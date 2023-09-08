//
//  SpringMotionViewVC.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/4/4.
//

import UIKit
import SwiftUI
import CUIDemoElements
import AKOCommonToolsKit

@objc(ProgressCircleViewVC)
public class ProgressCircleViewVC: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(progressCircleView)

        view.backgroundColor = .white

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.progressCircleView.resume()
        }
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressCircleView.center.x = view.center.x
        progressCircleView.center.y = view.center.y
    }

    private lazy var progressCircleView: ProgressCircleView = {
        let progressCircleView = ProgressCircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        progressCircleView.isNeedInnerTimer = true
        progressCircleView.reset()
        progressCircleView.progressBlock = { progress in
            print("progress-------->", progress)
        }
        progressCircleView.backgroundColor = .lightGray
        return progressCircleView
    }()
}
