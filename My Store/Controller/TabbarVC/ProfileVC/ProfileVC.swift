//
//  ProfileVC.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var btnLogout: UIButton!
    
    // MARK:- Variables
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    // MARK:- SetUpView
    private func setUpView() {
        btnLogout.setCornerAndBoreder(5.0, btnLogout.titleLabel?.textColor ?? UIColor.blue)
    }
    
    // MARK:- Button Actions
     @IBAction private func btnLogoutPressed(_ sender: UIButton) {
        logOut()
    }
    
    // MARK:- Custom Methods
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        pushLoginController()
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
