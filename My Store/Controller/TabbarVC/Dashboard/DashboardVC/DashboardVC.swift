//
//  DashboardVC.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var collectionView       : UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK:- Variables
    var arrProduct = [ProductModel]()
    var collectionDataSource: DashboardCollectionView?
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        callWebService()
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        collectionView.isHidden = true
        collectionDataSource = DashboardCollectionView()
        collectionView.delegate = collectionDataSource
        collectionView.dataSource = collectionDataSource
    }
    
    // MARK:- Button Actions
    // MARK:- API Calls
    private func callWebService() {
        activityIndicator.startAnimating()
        ProductDataBase.getProductLists { (res) in
            switch res {
            case .success( let obj):
                self.collectionView.isHidden = false
                self.activityIndicator.stopAnimating()
                self.arrProduct = obj
                self.collectionDataSource?.arrObject = self.arrProduct
                self.collectionView.reloadData()
            case.error(let strError):
                self.showAlert(strTitle: .Error, strMessage: strError)
            }
        }
    }
    
    // MARK:- Receive Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("Receive Memory Warning in \(String(describing: self))")
    }
    
    // MARK:- Deinit
    deinit {
        debugPrint("\(String(describing: self)) controller removed...")
    }
} //class
