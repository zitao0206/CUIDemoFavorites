//
//  CUIPlusElementsVC.swift
//  Home
//
//  Created by zitao0206 on 2023/03/31.
//

import UIKit
import Foundation
import AKOCommonToolsKit
import CUIDemoExamples

@objc(CUIDynamicViewVC)
@objcMembers
public class CUIDynamicViewVC : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!

    let cellReuseIdentifier = "CUIDynamicViewCell"

    lazy var items: [CUIDemoCellItemModel] = {
        return CUIDemoDynamicViewData.obtainData()
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
  
        // 创建 UICollectionViewFlowLayout 实例并设置其属性
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
    
        layout.itemSize = CGSize(width: (UIDevice.ako.screenWidth - 20), height: 200)
        
        // 创建 UICollectionView 实例并设置其属性
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CUIDynamicViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        view.backgroundColor = .white
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CUIDynamicViewCell
        cell.refreshData(items[indexPath.row])
        return cell
    }

    // MARK: - UICollectionViewDelegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        if let vc = item.detailVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
