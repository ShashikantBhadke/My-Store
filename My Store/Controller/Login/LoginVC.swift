//
//  LoginVC.swift
//  My Store
//
//  Created by Shashikant Bhadke on 17/08/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class LoginVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var btnGoogle: UIButton!
    
    // MARK:- Variables
    var isSignInSuccess: Bool?
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.pushTabBarController()
        }
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        self.title = "Google SignIn..."
        btnGoogle.setCorner(5.0)
        btnGoogle.backgroundColor = UIColor.white
        GIDSignIn.sharedInstance().delegate = self
    }
    
    // MARK:- Button Actions
    @IBAction private func btnLoginPressed(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    // MARK:- Custom Methods
    
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
