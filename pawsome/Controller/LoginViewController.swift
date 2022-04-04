//
//  LoginViewController.swift
//  Pawsome
//
//  Created by Roch on 3/23/22.
//

import UIKit
import SwiftSpinner

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordStackView: UIStackView!
    
    var walkerService = WalkerService()
    var ownerService = OwnerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    private func setupViews() {
        emailTextField.setUnderLine()
        passwordStackView.setUnderLine()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hideUnhideTapped(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else { self.alert(message: "Email is empty", title: nil, okAction: nil);
            return }
        guard email.isValidEmail() else { self.alert(message: "Email is invalid", title: nil, okAction: nil);
            return }
        guard let password = passwordTextField.text, !password.isEmpty else { self.alert(message: "Password is empty", title: nil, okAction: nil);
            return }
        
        SwiftSpinner.show("Logging In...")
        if NSLoginManager.isOwner() {
            self.ownerLogin(username: email, password: password)
        } else {
            self.walkerLogin(username: email, password: password)
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func ownerLogin(username:String, password:String){
        ownerService.login(email: username, password: password) { success, message, data in
            SwiftSpinner.hide()
            if success {
                // store username and password to check if user has logged in later
                GlobalConstants.KeyValues.token = data?.token ?? ""
                appDelegate.goToOwnerDashboardPage()
            } else {
                // show alert if username or password is incorrect
                self.alert(message: message, title: "Unauthorized", okAction: nil)
            }
        }
    }
    
    func walkerLogin(username:String, password:String){
        walkerService.login(email: username, password: password) { success, message, data in
            SwiftSpinner.hide()
            if success {
                // store username and password to check if user has logged in later
                GlobalConstants.KeyValues.token = data?.token ?? ""
                appDelegate.goToWalkerDashboardPage()
            } else {
                // show alert if username or password is incorrect
                self.alert(message: message, title: "Unauthorized", okAction: nil)
            }
        }
    }
    
}
