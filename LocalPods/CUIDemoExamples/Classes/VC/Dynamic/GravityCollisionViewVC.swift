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
import AudioToolbox
import SVProgressHUD

@objc(GravityCollisionViewVC)
public class GravityCollisionViewVC: UIViewController, CUISenderGravityCollisionViewDelegate {

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(gravityView)
        view.addSubview(gravityViewBtn)
    }

    private lazy var gravityView: SenderGravityCollisionView = {
        gravityView = SenderGravityCollisionView(frame: CGRect(x: 0, y: 0, width: UIDevice.ako.applicationWidth, height: UIDevice.ako.applicationHeight))
        gravityView.delegate = self
        return gravityView
    }()

    private lazy var gravityViewBtn: UIButton = {
        let size = self.view.bounds.size
        let gravityViewBtn = UIButton(frame: CGRect(x: size.width - 65, y: size.height - 55, width: 60, height: 50))
        gravityViewBtn.backgroundColor = .black
        gravityViewBtn.setTitle("发射台", for: .normal)
        gravityViewBtn.setTitleColor(.red, for: .normal)
        gravityViewBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        gravityViewBtn.addTarget(self, action: #selector(beginClick), for: .touchDown)
        gravityViewBtn.addTarget(self, action: #selector(endClick), for: .touchCancel)
        gravityViewBtn.addTarget(self, action: #selector(endClick), for: .touchUpInside)
        gravityViewBtn.addTarget(self, action: #selector(endClick), for: .touchUpOutside)
        return gravityViewBtn
    }()

    func setupGravityItemBeginPosition() {
        // 心心的起始发射坐标
        let startPoint = gravityViewBtn.frame.origin
        if startPoint.x == 0 || startPoint.y == 0 {
            return
        }
        gravityView.setupItemBeginPosition(startPoint)
    }

    @objc func beginClick() {
        setupGravityItemBeginPosition()
        gravityView.beginClick(true)
    }

    @objc func endClick() {
        gravityView.endClick()
    }

    // MARK: - CUISenderGravityCollisionViewDelegate

    public func number(ofClicked count: Int) {
        print("------->共计发射\(count)次")
//        SVProgressHUD.setInfoImage(UIImage(named: ""))
        SVProgressHUD.showInfo(withStatus: "共计发射\(count)次")
        SVProgressHUD.dismiss(withDelay: 2.0)
    }

    public func number(ofConcurrentClicked count: Int) {
        // Implement this method if needed
    }

    public func senderViewWillBeHidden() {
        // Implement this method if needed
    }
}
