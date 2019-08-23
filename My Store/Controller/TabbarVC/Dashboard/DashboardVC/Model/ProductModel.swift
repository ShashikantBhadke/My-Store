//
//  ProductModel.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(String)
}//enum

struct ProductModel {
    var intId: Int?
    var strName: String?
    var dobPrice: Double?
    var dobOldPrice: Double?
    var strImageName: String?
    
    static func getSampleData(_ complection: @escaping(Result<[ProductModel]?>)->()) {
        let obj1 = ProductModel(intId: 0, strName: "AIR MAX 91", dobPrice: 149, dobOldPrice: 200, strImageName: "sample1")
        let obj2 = ProductModel(intId: 1, strName: "AIR MAX 92", dobPrice: 129, dobOldPrice: nil, strImageName: "sample2")
        let obj3 = ProductModel(intId: 2, strName: "AIR MAX 93", dobPrice: 143, dobOldPrice: 200, strImageName: "sample3")
        let obj4 = ProductModel(intId: 3, strName: "AIR MAX 94", dobPrice: 110, dobOldPrice: 309, strImageName: "sample2")
        let obj5 = ProductModel(intId: 4, strName: "AIR MAX 95", dobPrice: 209, dobOldPrice: nil, strImageName: "sample1")
        let obj6 = ProductModel(intId: 5, strName: "AIR MAX 96", dobPrice: 250, dobOldPrice: 340, strImageName: "sample3")
        
        complection(.success([obj1, obj2, obj3, obj4, obj5, obj6,]))
    }
} //struct
