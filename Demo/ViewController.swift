//
//  ViewController.swift
//  Demo
//
//  Created by Oscar Chilel on 1/13/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFacebookLoginButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupFacebookLoginButton(){
        // Add a custom login button to your app
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.backgroundColor = UIColor.darkGray
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        myLoginButton.center = view.center;
        myLoginButton.setTitle("Cicklo Demo Login", for: .normal)
        
        // Handle clicks on the button
        myLoginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        // Add the button to the view
        self.view.addSubview(myLoginButton)
    }
    
    func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
            }
        }
    }


}

