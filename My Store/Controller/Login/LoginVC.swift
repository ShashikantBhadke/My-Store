//
//  LoginVC.swift
//  My Store
//
//  Created by Shashikant Bhadke on 17/08/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    // MARK:- Outlets
    // MARK:- Variables
    // MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK:- SetUpView
    private func setUpView() {
    }
    // MARK:- Button Actions
    @IBAction private func btnLoginPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            sender.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        }) { (bool) in
            if bool {
                sender.transform = .identity
                self.pushTabbarVC()
            }
        }
    }
    // MARK:- API Calls
    // MARK:- Custom Methods
    private func pushTabbarVC() {
        guard let tabbarVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: TabbarVC.self)) as? TabbarVC, let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.rootViewController = tabbarVC
    }
    // MARK:- Receive Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("Receive Memory Warning in \(String(describing: self))")
    }
    
    // MARK:- Deinit
    deinit {
        debugPrint("\(String(describing: self)) controller removed...")
    }
} //class
