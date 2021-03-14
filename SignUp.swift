//
//  SignUp.swift
//  D&D
//
//  Created by Hassall, Oscar (HWTA) on 16/02/2021.
//  Copyright © 2021 Hassall, Oscar (HWTA). All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func EnterButtonPressed(_ sender: Any) {
        if email.hasText && password.hasText {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { authResult, error in
              print(authResult)
            }
        } else {
            let validationAlert = UIAlertController(title: "ERROR", message: "EMAIL AND/OR PASSWORD NOT ENTERED", preferredStyle: .alert)
            
            validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(validationAlert, animated: true)
        }
        
    }
    
    
    
    
}
