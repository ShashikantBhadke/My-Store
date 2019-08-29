//
//  DashboardVC+DashboardCollectionView.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/29/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

// MARK:- Extension for -
extension DashboardVC: protocolDashboardCollectionView {
    func didSelectItem(intIndex: Int, obj: ProductModel) {
        if arrProduct.count > intIndex, let id = arrProduct[intIndex].id {
            ProductDataBase.updateProduct(id, arrProduct[intIndex]) { (res) in
                switch res {
                case .success(_ ):
                    self.showAlert(strTitle: .Error, strMessage: .productUpdate)
                case .error(let strError):
                    self.showAlert(strTitle: .Bonzi, strMessage: strError)
                }
            }
        }
    }
} //extension
