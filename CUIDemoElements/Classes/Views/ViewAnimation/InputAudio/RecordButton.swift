//
//  RecordButton.swift
//  Pods
//
//  Created by Leon0206 on 2021/4/18.
//

import Foundation
import UIKit
import BlocksKit

class RecordButton: UIButton {
    
    typealias Action = (RecordButton) -> Void
    
    var shouldBeginAction: (RecordButton) -> Bool = { _ in
        return true
    }
    var beginAction: Action?
    var recordingAction: Action?
    var cancelingAction: Action?
    var cancelAction: Action?
    var finishAction: Action?
    
    private enum Status {
        case disable
        case initial
        case recording
        case canceling
        case cancel
        case finish
    }
    
    private var initialTitle: String {
        return "按住 说话"
    }
    
    private var recordingTitle: String {
        return "松开 发送"
    }
    
    private var cancelingTitle: String {
        return "松开 取消"
    }
    
    private var title: String? {
        set {
            setTitle(newValue, for: .normal)
        }
        get {
            title(for: .normal)
        }
    }
    
    private var status: Status = .initial {
        didSet {
            var idle = false
            switch oldValue {
            case .initial, .cancel, .finish:
                idle = true
            default:
                break
            }
            
            switch status {
            case .disable:
                title = initialTitle
            case .initial:
                title = initialTitle
            case .recording:
                title = recordingTitle
                if idle {
                    beginAction?(self)
                } else {
                    recordingAction?(self)
                }
            case .canceling:
                title = cancelingTitle
                cancelingAction?(self)
            case .cancel:
                title = initialTitle
                cancelAction?(self)
            case .finish:
                title = initialTitle
                finishAction?(self)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialUI()
        bk_addEventHandler({ [unowned self] _ in
            // 需要先校验权限
            if self.shouldBeginAction(self) {
                self.status = .recording
            } else {
                self.status = .disable
            }
        }, for: .touchDown)
        
        bk_addEventHandler({ [unowned self] _ in
            guard self.status != .disable else { return }
            self.status = .recording
        }, for: .touchDragInside)
        
        bk_addEventHandler({ [unowned self] _ in
            guard self.status != .disable else { return }
            self.status = .canceling
        }, for: .touchDragOutside)
        
        bk_addEventHandler({ [unowned self] _ in
            guard self.status != .disable else { return }
            self.status = .cancel
        }, for: .touchUpOutside)
        
        bk_addEventHandler({ [unowned self] _ in
            guard self.status != .disable else { return }
            self.status = .finish
        }, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialUI() {
        isExclusiveTouch = true
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel?.left = 10
        titleLabel?.textAlignment = .center
        setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .normal)
        setBackgroundImage(UIImage.cui_image(with: UIColor(white: 1, alpha: 0.1)), for: .highlighted)
        setTitle(initialTitle, for: .normal)
    }
}
