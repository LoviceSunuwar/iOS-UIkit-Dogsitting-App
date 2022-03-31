//
//  SignupViewController.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/24/22.
//

import UIKit
import SwiftSpinner

class SignupViewController: UIViewController {
    
    var walkerService = WalkerService()
    var ownerService = OwnerService()
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordStackView: UIStackView!
    @IBOutlet weak var dogNameStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    private func setupViews() {
        fullNameTextField.setUnderLine()
        dogNameTextField.setUnderLine()
        phoneNumberTextField.setUnderLine()
        emailTextField.setUnderLine()
        passwordStackView.setUnderLine()
        dogNameStackView.isHidden = !(NSLoginManager.isOwner())
    }
    
    private func dismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hideUnhideButtonTapped(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismissView()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.dismissView()
    }
    
    @IBAction func termsAndConditionButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        guard let fullName = fullNameTextField.text, !fullName.isEmpty else { self.alert(message: "Full name is empty", title: nil, okAction: nil);
            return }
        guard let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else { self.alert(message: "Phone Number is empty", title: nil, okAction: nil);
            return }
        guard phoneNumber.isPhoneNumber else { self.alert(message: "Phone Number is invalid", title: nil, okAction: nil);
            return }
        guard let email = emailTextField.text, !email.isEmpty else { self.alert(message: "Email is empty", title: nil, okAction: nil);
            return }
        guard email.isValidEmail() else { self.alert(message: "Email is invalid", title: nil, okAction: nil);
            return }
        guard let password = passwordTextField.text, !password.isEmpty else { self.alert(message: "Password is empty", title: nil, okAction: nil);
            return }
        guard password.count >= 8 else { self.alert(message: "Password should be greater than 8", title: nil, okAction: nil);
            return }
        
        
        //go to login or dash board
        
        if NSLoginManager.isOwner() {
            guard let dogName = dogNameTextField.text else { self.alert(message: "Dog name is empty", title: nil, okAction: nil);
                return }
            self.registerOwner(fullName: fullName, dogName: dogName, phone: phoneNumber, email: email, password: password)
        } else {
            self.registerWalker(fullName: fullName, experience: "", price: "", phone: phoneNumber, email: email, password: password)
        }
        
    }
    
    
    func registerOwner(fullName:String, dogName:String, phone:String, email:String, password:String){
        
        ownerService.registerOwner(fullName: fullName, dogName: dogName, phone: phone, email: email, password: password){success, message, data in
            if success {
                GlobalConstants.KeyValues.token = data?.token ?? ""
                
                appDelegate.goToOwnerDashboardPage()
            } else {
                self.alert(message: message, title: "Registration Failed", okAction: nil)
            }
            
        }
    }
    
    func registerWalker(fullName:String, experience:String,price:String, phone:String, email:String, password:String){
        walkerService.registerWalker(fullName: fullName, experience: experience, price: price, phone: phone, email: email, password: password){success, message, data in
            if success {
                GlobalConstants.KeyValues.token = data?.token ?? ""
                appDelegate.goToWalkerDashboardPage()
            } else {
                self.alert(message: message, title: "Registration Failed", okAction: nil)
            }
            
        }
    }
    
}
