//
//  UIViewController+MyStore.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/23/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

// MARK:- Extension for UIViewController
extension UIViewController {
    
    func pushTabBarController() {
        guard let tabbarVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: TabbarVC.self)) as? TabbarVC, let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.rootViewController = tabbarVC
    }
    
    func pushLoginController() {
        guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: LoginVC.self)) as? LoginVC, let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.rootViewController = loginVC
    }
    
    func showAlert(strTitle: AlertTitle, strMessage: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: strTitle.rawValue, message: strMessage, preferredStyle: .alert)
            let okButton = UIAlertAction(title: AlertBtn.Ok.rawValue, style: .cancel) { (_ ) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
} //extension
