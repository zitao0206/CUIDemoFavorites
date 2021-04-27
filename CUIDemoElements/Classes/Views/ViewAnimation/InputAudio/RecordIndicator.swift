//
//  RecordIndicator.swift
//  Pods
//
//  Created by Leon0206 on 2021/4/18.
//

import Foundation
import SnapKit

@objc(CUIRecordIndicator)
@objcMembers
public class RecordIndicator: UIView {
    
    @objc public enum Status:Int {
        case none = 0
        case recording
        case cancel
        case tooShort
    }
    
    @objc
    public static let shared = RecordIndicator()
    
    var timer : Timer? = nil
    
    public var status: Status = .none {
        didSet {
            if status != oldValue {
                reload()
            }
        }
    }
    
    let cancelView = RecordCancelView()
    
    let recordingView = RecordingView()
    
     let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
     let recordingBgView: UIView = {
        let gradientView = UIView()
        gradientView.backgroundColor = UIColor.cui_color(withHex: 0x3A5C8C, alpha: 0.3)
        gradientView.layer.cornerRadius = 40
        gradientView.layer.masksToBounds = true
        return gradientView
    }()
    
     let cancelBgView: UIView = {
        let gradientView = UIView()
        gradientView.backgroundColor = UIColor.cui_color(withHex: 0x672379, alpha: 0.3)
        gradientView.layer.cornerRadius = 40
        gradientView.layer.masksToBounds = true
        return gradientView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(recordingBgView)
        addSubview(cancelBgView)
        addSubview(recordingView)
        addSubview(cancelView)
        addSubview(label)
        
        recordingBgView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0)
        }
        
        cancelBgView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0)
        }
        
        cancelView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
        }
        
        recordingView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(36)
        }
        
        label.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-28)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        reload()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: 175, height: 175)
    }
    
    // MARK: - Public
    @objc public static func show(status: Status, onView: UIView) {
        
        let centerOffset: CGPoint = .zero
        if let superview = shared.superview, superview != onView {
            shared.removeFromSuperview()
        }
        
        if shared.superview == nil {
            onView.addSubview(shared)
            shared.alpha = 0
            shared.layer.removeAllAnimations()
            UIView.animate(withDuration: 0.25) {
                shared.alpha = 1
            }
        }
        
        shared.status = status
        shared.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview().offset(centerOffset.x)
            make.centerY.equalToSuperview().offset(centerOffset.y)
        }
    }
    
    public static func dismiss() {
        guard shared.superview != nil else { return }
        shared.status = .none
        UIView.animate(withDuration: 0.25) {
            shared.alpha = 0
        } completion: { _ in
            shared.removeFromSuperview()
        }
        shared.timer?.invalidate()
        shared.timer = nil
    }
    
    public static func dismissWithoutDelay() {
        guard shared.superview != nil else { return }
        shared.status = .none
        shared.alpha = 0
        shared.removeFromSuperview()
        shared.timer?.invalidate()
        shared.timer = nil
    }
    
    // MARK: -
     func reload() {
        switch status {
        case .recording:
            recordingBgView.isHidden = false
            cancelBgView.isHidden = true
            label.text = "松开发送，上滑取消"
            cancelView.isHidden = true
            recordingView.startAnimating()
        case .cancel:
            recordingBgView.isHidden = true
            cancelBgView.isHidden = false
            label.text = "松开手指 取消发送"
            cancelView.isHidden = false
            recordingView.stopAnimating()
        case .tooShort:
            recordingBgView.isHidden = true
            cancelBgView.isHidden = false
            label.text = "说话时间太短"
            cancelView.isHidden = false
            recordingView.stopAnimating()
            if timer != nil {
                timer?.invalidate()
                timer = nil
            }
            timer = Timer.bk_scheduledTimer(withTimeInterval: 1.5, block: { [weak self] (timer) in
                if self?.status == .tooShort {
                    RecordIndicator.dismiss()
                }
            }, repeats: false)
            print("说话时间太短")
        case .none: break
        }
    }
}

// MARK: - Subview

class RecordCancelView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cui_record_indicator_cancel")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(14)
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 80)
    }
}

class RecordingView: UIView {
    
    class AnimatingView: UIView {
        
        let progressView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.white
            return view
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            layer.cornerRadius = 17
            layer.masksToBounds = true
            addSubview(progressView)

        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: 34, height: 60)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            progressView.frame = CGRect(x: 0, y: 60, width: bounds.width, height: 60)
        }
        
        func startAnimating() {
            stopAnimating()
            let animation = CABasicAnimation(keyPath: "position.y")
            
            animation.fromValue = intrinsicContentSize.height + intrinsicContentSize.height / 2 - 15
            animation.toValue = intrinsicContentSize.height / 2 + 25
            animation.duration = 0.75
            animation.repeatCount = Float.greatestFiniteMagnitude
            progressView.layer.add(animation, forKey: "ProgressAnimation")
        }
        
        func stopAnimating() {
            progressView.layer.removeAllAnimations()
        }
    }
    
    let animatingView = AnimatingView()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cui_record_indicator_recording")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(imageView)
        
        imageView.addSubview(animatingView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(52)
            make.height.equalTo(81)
            make.center.equalToSuperview()
        }
        
        animatingView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0)
        }
    }
    
    override var isHidden: Bool {
        didSet {
            if isHidden {
                animatingView.stopAnimating()
            }
        }
    }
    
    func startAnimating() {
        guard !isHidden else {
            return
        }
        animatingView.startAnimating()
    }
    
    func stopAnimating() {
        animatingView.stopAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
      
    }
}
