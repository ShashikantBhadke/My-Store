//
//  LoginVC+GoogleAuth.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/23/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

// MARK:- Extension for GIDSignInDelegate
extension LoginVC: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            debugPrint(error.localizedDescription)
            self.isSignInSuccess = false
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                self.isSignInSuccess = false
                return
            }
            self.isSignInSuccess = true
            self.pushTabBarController()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
} //extension
