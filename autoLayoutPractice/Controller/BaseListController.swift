//
//  BaseListController.swift
//  autoLayoutPractice
//
//  Created by 石川大輔 on 2021/06/20.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
