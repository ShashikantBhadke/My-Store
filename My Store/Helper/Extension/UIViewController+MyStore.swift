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
    
} //extension
