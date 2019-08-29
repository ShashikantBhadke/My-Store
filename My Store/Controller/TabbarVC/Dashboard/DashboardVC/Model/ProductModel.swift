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
    var id: Int?
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
    
    class func updateProduct(_ intID: Int, _ product: ProductModel, _ complection: @escaping(Result<Bool>)->()) {
        if ref == nil {
            ref = Database.database().reference()
        }
        
        var parameters = [String: Any]()
        
        parameters["desc"] = "We can change data from ios device...😅"
        parameters["file"] = product.file ?? ""
        parameters["id"] = product.id ?? 1000
        parameters["name"] = product.name ?? ""
        parameters["price"] = product.price ?? 10109
        
        ref.child("ProductTable").child("\(intID)").setValue(parameters) { (err, _ref) in
            if let _err = err {
                var strError = AlertMessage.somethingWrong.rawValue
                strError = _err.localizedDescription
                complection(.error(strError))
            } else {
                complection(.success(true))
            }
        }
    }
} // class

extension Collection {
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
