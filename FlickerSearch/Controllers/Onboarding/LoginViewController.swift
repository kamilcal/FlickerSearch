//
//  LoginViewController.swift
//  FlickerSearch
//
//  Created by kamilcal on 13.12.2022.
//

import Foundation
import UIKit
import FirebaseAuth
import SafariServices

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftImage.layer.cornerRadius = leftImage.frame.height/2
        rightImage.layer.cornerRadius = leftImage.frame.height/2
        emailtextField.layer.cornerRadius = CGFloat(8.0)
        emailtextField.layer.borderWidth = 1.0
        emailtextField.layer.borderColor = UIColor.secondaryLabel.cgColor
        emailtextField.layer.masksToBounds = true
        passwordtextField.layer.cornerRadius = CGFloat(8.0)
        passwordtextField.layer.borderWidth = 1.0
        passwordtextField.layer.borderColor = UIColor.secondaryLabel.cgColor
        passwordtextField.layer.masksToBounds = true

        
        
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "flicker"
        for i in titleText {
            Timer.scheduledTimer(withTimeInterval: charIndex * 0.1 , repeats: false) { (time) in
                self.titleLabel.text?.append(i)
            }
            charIndex += 1
            
            
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        sender.layer.cornerRadius = 4
        guard let emailText = emailtextField.text, !emailText.isEmpty,
              let passwordText = passwordtextField.text, !passwordText.isEmpty else { return }
        
        
        if let email = emailtextField.text, let password = passwordtextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if authResult != nil, error == nil {
                    self.performSegue(withIdentifier: "loginToFlicker", sender: self)
                } else {
                    let alert = UIAlertController(title: "Log In Error",
                                                  message: "We were unable to log you in.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel ))
                    self.present(alert, animated: true)
                }
                
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
    performSegue(withIdentifier: "loginToRegister", sender: self)
        
    }
    
    @IBAction func termsButton(_ sender: UIButton) {
        guard let url = URL(string: "https://www.flickr.com/help/terms") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    
    @IBAction func privacyButton(_ sender: UIButton) {
        guard let url = URL(string: "https://www.flickr.com/help/privacy") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    
    
}
