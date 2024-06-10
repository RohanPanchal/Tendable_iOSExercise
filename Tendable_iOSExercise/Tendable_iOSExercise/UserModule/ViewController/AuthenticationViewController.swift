//
//  AuthenticationViewController.swift
//  Tendable_iOSExcerise
//
//  Created by Rohan Panchal on 05/06/24.
//

import Foundation
import UIKit

class AuthenticationViewController: UIViewController {
    @IBOutlet var txtEmail: UITextField?
    @IBOutlet var txtPassword: UITextField?
    @IBOutlet var lblError: UILabel?

    @IBOutlet var btnRegister: UIButton?
    @IBOutlet var btnLogin: UIButton?
    
    let viewModel = AuthenticationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Action
extension AuthenticationViewController {
    @IBAction func buttonClicked(sender: UIButton) {
        if self.validate() {
            self.view.alpha = 0.5
            if sender.tag == 0 {
                loginTapped()
            } else {
                registerTapped()
            }
        } else {
            self.lblError?.text = "Data can not be blank"
        }
    }
    
   func validate() -> Bool {
       if let email = txtEmail?.text, let pwd = txtPassword?.text, email.count > 0 && pwd.count > 0 {
           return true
       }
       
       return false
    }
}

// MARK: - API calls
extension AuthenticationViewController {
    func loginTapped() {
        guard let email = txtEmail?.text, let password = txtPassword?.text else { return }
        viewModel.login(email: email, password: password) {isSuccess in
            self.view.alpha = 1

            if isSuccess {
                // Navigate to the Inspections List screen
                self.lblError?.text = "Login Successfull"
                self.navigateToInspectionsVC()
            } else {
               self.lblError?.text = self.viewModel.errorMessage
            }
        }
    }
    
    func registerTapped() {
        guard let email = txtEmail?.text, let password = txtPassword?.text else { return }
        viewModel.register(email: email, password: password) {isSuccess in
            self.view.alpha = 1

            if isSuccess {
                // Navigate to the Inspections List screen
                self.lblError?.text = "Registration Successfull"
                self.navigateToInspectionsVC()
            } else {
                self.lblError?.text = self.viewModel.errorMessage
            }
        }
    }
}

// MARK: - Navigation
extension AuthenticationViewController {
    func navigateToInspectionsVC() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let inspectionsVC = storyBoard.instantiateViewController(withIdentifier: "InspectionsViewController") as! InspectionsViewController
        self.navigationController?.pushViewController(inspectionsVC, animated: true)
    }
}

