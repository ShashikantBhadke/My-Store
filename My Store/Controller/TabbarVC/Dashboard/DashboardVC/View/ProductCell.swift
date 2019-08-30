//
//  ProductCell.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import Kingfisher

protocol protocolProductCell: class {
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
    weak var delegate   : protocolProductCell?
    
    // MARK:- Default Methods
    override func awakeFromNib() {
        viewMain.layer.cornerRadius = 10.0
    }
    
    // MARK:- SetUP Data
    private func setUpData() {
        resetData()
        
        guard let obj = product else { return }
        lblTitle.text = obj.name ?? ""
        lblPrice.text = "₹ " + "\(obj.price ?? 0)"
        if let intOldPrice = obj.oldPrice {
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "₹ " + "\(intOldPrice)")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            lblOldPrice.attributedText = attributeString
        }
        if let strImgName = obj.file, !strImgName.isEmpty, let url = URL(string: strImgName) {
            let resize = ResizingImageProcessor(referenceSize: imgvProduct.frame.size)
            imgvProduct.kf.setImage(with: url, placeholder: nil, options: [.processor(resize)], progressBlock: nil)
        }
    }
    
    private func resetData() {
        imgvProduct.image   = nil
        lblTitle.text       = ""
        lblOldPrice.attributedText = nil
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
