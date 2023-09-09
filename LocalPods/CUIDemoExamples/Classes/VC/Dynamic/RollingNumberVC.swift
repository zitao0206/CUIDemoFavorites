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

@objc(RollingNumberVC)
public class RollingNumberVC: UIViewController {
    
    var foldNumber1: RollingNumberView!
    var foldNumber2: RollingNumberView!
    var timer: Timer!
    var number: Int = 0

    public override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

            foldNumber1 = RollingNumberView { config in
                config.backgroundColor = .red
                config.textColor = .black
                config.labelBgColor = .lightGray
                config.places = 10
                config.labelSize = CGSize(width: 30, height: 30)
                config.labelMargin = 5
                config.changeMode = .meanwhileMode
            }
            view.addSubview(foldNumber1)

            foldNumber2 = RollingNumberView { config in
                config.backgroundColor = .red
                config.textColor = .black
                config.labelBgColor = .lightGray
                config.places = 0
                config.labelSize = CGSize(width: 30, height: 40)
                config.labelMargin = 5
                config.changeMode = .randomMode
            }
            view.addSubview(foldNumber2)

            number = 0
            timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateNumber), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: .common)
        }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let num1 = Int(arc4random()) % 10000000000
            foldNumber1.numberValue = "\(num1)"
        }

        @objc func updateNumber() {
            number += 500
            foldNumber2.numberValue = "\(self.number)"
            foldNumber2.right = view.frame.width - 30
        }

    public override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()

            foldNumber1.center.x = view.center.x
            foldNumber1.top = 300

            foldNumber2.right = view.frame.width - 30
            foldNumber2.top = 380
        }
    
}
