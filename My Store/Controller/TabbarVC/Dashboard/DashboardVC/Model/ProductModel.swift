//
//  ProductModel.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import Foundation

struct ProductModel: Codable {
    var id: Int?
    var desc: String?
    var name: String?
    var price: Int?
    var oldPrice: Int?
    var file: String?
    var quantity: Int?
} //struct
