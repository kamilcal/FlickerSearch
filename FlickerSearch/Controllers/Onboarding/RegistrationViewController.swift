//
//  RegistrationViewController.swift
//  FlickerSearch
//
//  Created by kamilcal on 13.12.2022.
//

import Foundation
import UIKit
import FirebaseAuth


class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        emailTextField.layer.cornerRadius = CGFloat(8.0)
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.secondaryLabel.cgColor
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = CGFloat(8.0)
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.secondaryLabel.cgColor
        passwordTextField.layer.masksToBounds = true
    }
    
    @IBAction func signinButton(_ sender: UIButton) {
        
        guard let emailText = emailTextField.text, !emailText.isEmpty,
              let passwordText = passwordTextField.text, !passwordText.isEmpty, passwordText.count >= 8 else { return }
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "registerToFlicker", sender: self)
                }
            }
            
        }
        
    }
}
