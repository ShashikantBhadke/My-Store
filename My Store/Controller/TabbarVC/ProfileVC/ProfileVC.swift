//
//  ProfileVC.swift
//  My Store
//
//  Created by Shashikant's Mac on 8/21/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
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
    // MARK:- API Calls
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
