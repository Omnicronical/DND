//
//  SignInViewController.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 16/02/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func EnterButtonPressed(_ sender: Any) {
        if email.hasText && password.hasText {
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                print(authResult)
                if Auth.auth().currentUser != nil {
                  print("LOGGED IN")
               
                } else {
                  print("NOT LOGGED IN")
                  
                }
            }
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "EMAIL AND/OR PASSWORD NOT ENTERED", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
    }
    
    
    @IBAction func CreateANewUserButtonPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController", creator: { coder in
            return SignUpViewController(coder: coder)
        }) else {
            fatalError("Failed to Load Sign Up")
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
