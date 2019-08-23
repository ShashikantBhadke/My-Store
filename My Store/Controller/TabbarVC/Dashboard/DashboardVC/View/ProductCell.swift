//
//  ProductCell.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

protocol ProductCellProtocol: class {
    func btnLikePressed(intIndex: Int)
    func btnCartPressed(intIndex: Int)
}

class ProductCell: UICollectionViewCell {
    
    // MARK:- Outlets
    @IBOutlet private weak var viewMain             : UIView!
    @IBOutlet private weak var imgvProduct          : UIImageView!
    @IBOutlet private weak var lblTitle             : UILabel!
    @IBOutlet private weak var lblOldPrice          : UILabel!
    @IBOutlet private weak var lblPrice             : UILabel!
    @IBOutlet private weak var btnLike              : UIButton!
    @IBOutlet private weak var btnCart              : UIButton!
    
    // MARK:- Variables
    var intIndex        : Int?
    var product         : ProductModel? {
        didSet {
            setUpData()
        }
    }
    weak var delegate   : ProductCellProtocol?
    
    // MARK:- Default Methods
    override func awakeFromNib() {
        viewMain.layer.cornerRadius = 10.0
    }
    
    // MARK:- SetUP Data
    private func setUpData() {
        resetData()
        
        guard let obj = product else { return }
        lblTitle.text = obj.strName ?? ""
        lblPrice.text = "$ " + String(format: "%.01f", obj.dobPrice ?? 0.00)
        if let dobOldPrice = obj.dobOldPrice {
            lblOldPrice.text = "$ " + String(format: "%.01f", dobOldPrice)
        }
        if let strImgName = obj.strImageName, !strImgName.isEmpty {
            imgvProduct.image = UIImage.init(named: strImgName)
        }        
    }
    
    private func resetData() {
        imgvProduct.image   = nil
        lblTitle.text       = ""
        lblOldPrice.text    = ""
        lblPrice.text       = ""
    }
    
    // MARK:- Button Action
    @IBAction private func btnLikePressed(_ sender: UIButton) {
        guard let intIndex = self.intIndex else { return }
        delegate?.btnLikePressed(intIndex: intIndex)
    }
    @IBAction private func btnCartPressed(_ sender: UIButton) {
        guard let intIndex = self.intIndex else { return }
        delegate?.btnCartPressed(intIndex: intIndex)
    }
} // class
