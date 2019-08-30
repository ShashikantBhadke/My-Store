//
//  DashboardVC+DashboardCollectionView.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/29/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

// MARK:- Extension for - DashboardCollectionView
extension DashboardVC: protocolDashboardCollectionView {
    func didSelectItem(intIndex: Int, obj: ProductModel) {
    }
} //extension

// MARK:- Extension for - ProductCell
extension DashboardVC: protocolProductCell {
    func btnLikePressed(intIndex: Int) {
    }
    
    func btnCartPressed(intIndex: Int) {
    }
} //extension
