//
//  UIView+MyStore.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/23/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

// MARK:- Extension for UIView
extension UIView {
    
    func setCorner(_ value: CGFloat) {
        self.layer.cornerRadius = value
    }
    
    func setCornerAndBoreder(_ value: CGFloat, _ clr: UIColor) {
        self.layer.cornerRadius = value
        self.layer.borderWidth = 1.0
        self.layer.borderColor = clr.cgColor
    }
    
} //extension
