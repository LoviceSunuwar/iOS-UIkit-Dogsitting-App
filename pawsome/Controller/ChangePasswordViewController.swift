//
//  ChangePasswordViewController.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import UIKit
import SwiftSpinner

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    let profileServices = ProfileService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Change Password"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        view.endEditing(true)
        guard let oldPassword = oldPasswordTextField.text, !oldPassword.isEmpty else {
            alert(message: "Old password is empty", title: nil, okAction: nil)
            return }
        
        guard let password = newPasswordTextField.text, !password.isEmpty else {
            alert(message: "New password is empty", title: nil, okAction: nil)
            return }
        
        guard let confirmPassword = confirmPasswordTextfield.text, confirmPassword == password else {
            alert(message: "New password and confirm password donot match", title: nil, okAction: nil)
            return }
        SwiftSpinner.show("Changing Password")
        profileServices.changePassword(oldPassword: oldPassword, newPassword: password) { success, message in
            SwiftSpinner.hide()
            if success {
                self.alert(message: "Password changed successfully", title: "Success") {
                    self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.alert(message: message, title: "Error", okAction: nil)
            }
            
        }
        
    }
}
