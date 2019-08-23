//
//  DashboardCollectionView.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

protocol DashboardCollectionViewProtocol: class {
    func didSelectItem(intIndex: Int, obj: ProductModel)
}

class DashboardCollectionView: NSObject {
    
    // MARK:- Variables
    var arrObject = [ProductModel]()
    weak var delegate: UIViewController? {
        didSet {
            _delegate = delegate as? DashboardCollectionViewProtocol
        }
    }
    internal weak var _delegate: DashboardCollectionViewProtocol?
} //class
