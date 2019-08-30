//
//  FirebaseDataCall.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/30/19.
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

class ProductDataBase {
    
    /// Initialize  Firebase referance
    private init () { }
    private static var ref: DatabaseReference!
    
    /// Get Product List
    class func getProductLists(_ complection: @escaping(Result<[ProductModel]>)->()) {
        if ref == nil {
            ref = Database.database().reference()
        }
        ref.child(FirebaseTable.ProductTable.rawValue).observeSingleEvent(of: .value, with: { (snapshot) in
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
        
        ref.child(FirebaseTable.ProductTable.rawValue).child("\(intID)").setValue(parameters) { (err, _ref) in
            if let _err = err {
                var strError = AlertMessage.somethingWrong.rawValue
                strError = _err.localizedDescription
                complection(.error(strError))
            } else {
                complection(.success(true))
            }
        }
    }
    
    /// Get WishList or Cart List
    class func getProductListsFor(_ type: FirebaseTable,_ complection: @escaping(Result<[ProductModel]>)->()) {
        guard let userID = Auth.auth().currentUser?.uid else {
            UIViewController().pushLoginController()
            return
        }
        if ref == nil {
            ref = Database.database().reference()
        }
        ref.child(type.rawValue).child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
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
    
    /// Get WishList or Cart List
    class func addProductTo(_ type: FirebaseTable,_ quantity: Int, _ product: ProductModel, _ complection: @escaping(Result<Bool>)->()) {
        guard let userID = Auth.auth().currentUser?.uid else {
            UIViewController().pushLoginController()
            return
        }
        if ref == nil {
            ref = Database.database().reference()
        }
        var parameters = [String: Any]()
        
        parameters["desc"] = product.desc ?? ""
        parameters["file"] = product.file ?? ""
        parameters["id"] = product.id ?? 1000
        parameters["name"] = product.name ?? ""
        parameters["price"] = product.price ?? 10109
        if type == .Cart {
            parameters["quantity"] = quantity
        }
        ref.child(type.rawValue).child(userID).setValue(parameters) { (err, _ref) in
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

// MARK:- Extension For
extension Collection {
    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
