//
//  ViewController.swift
//  Demo
//
//  Created by Oscar Chilel on 1/13/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.current() != nil)
        {
            //Verifica si hay una session de facebook
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
            self.returnUserData()
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
        
    }
    
    // Facebook Delegate Metodos
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        //Bandera que imprime al usuario logueado
        print("User Logueado")
        
        if ((error) != nil)
        {
            // Condicional para procesar el error
        }
        else if result.isCancelled {
            // Condicional para procesar si el usuario cancela el login
        }
        else {
            // Verificar el email
            if result.grantedPermissions.contains("email")
            {
                // Do work
                print("Usuario Logueado Exitosamente")
            }
            
            self.returnUserData()
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        // Boton para hacer el logout del usuario
        print("Logout")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Imprime el error en caso hubiera
                print("Error: \(error)")
            }
            else
            {
                print("Usuario logueado: \(result)")
            }
        })
    }
}
