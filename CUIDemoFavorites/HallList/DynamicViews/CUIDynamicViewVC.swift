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
public class CUIDynamicViewVC : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    var collectionView: UICollectionView!

    let cellReuseIdentifier = "CUIDynamicViewCell"

    lazy var items: [CUIDemoItemModel] = {
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
       
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

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
        if let detailVC = item.detailVCName.obtainObj() as? UIViewController {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
       // 当滚动开始时停止cell内部动画播放
       for cell in collectionView.visibleCells {
           if let showcell = cell as? CUIDynamicViewCell {
               showcell.stopAnimation()
           }
       }
    }

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
       // 当滚动结束时重新开始cell内部动画播放
       if !decelerate {
           for cell in collectionView.visibleCells {
               if let showcell = cell as? CUIDynamicViewCell {
                   showcell.startAnimation()
               }
           }
       }
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       // 当减速停止时重新开始cell内部动画播放
       for cell in collectionView.visibleCells {
           if let showcell = cell as? CUIDynamicViewCell {
               showcell.startAnimation()
           }
       }
    }
}
