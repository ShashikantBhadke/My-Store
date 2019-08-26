//
//  ProductModel.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//


import Firebase
import Foundation
import FirebaseAuth
import FirebaseDatabase

enum Result<T> {
    case success(T)
    case error(String)
}//enum

struct ProductModel: Codable {
    var desc: String?
    var name: String?
    var price: Int?
    var oldPrice: Int?
    var file: String?
} //struct


class ProductDataBase {
    /// Initialize  FIrebase referance
    private init () { }
    private static var ref: DatabaseReference!
    
    class func getProductLists(_ complection: @escaping(Result<[ProductModel]>)->()) {
        if ref == nil {
            ref = Database.database().reference()
        }
        ref.child("ProductTable").observeSingleEvent(of: .value, with: { (snapshot) in
            guard var myObj = snapshot.value as? [Any] else {
                complection(.error(AlertMessage.parseError.rawValue))
                return
            }
            for i in 0..<myObj.count - 1 {
                if myObj[i] is NSNull {
                    myObj.remove(at: i)
                }
            }
            guard let _data = myObj.jsonData else {
                complection(.error(AlertMessage.parseError.rawValue))
                return
            }
            
            do {
                let mydata =  try JSONDecoder().decode([ProductModel].self, from: _data)
                complection(.success(mydata))
            } catch let decodeError {
                complection(.error(decodeError.localizedDescription))
            }
        }) { (err) in
            var strError = AlertMessage.somethingWrong.rawValue
            strError = err.localizedDescription
            complection(.error(strError))
        }
    }
} // class

extension Collection {
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
