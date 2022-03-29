//
//  RegistrationViewController.swift
//  pawsome
//
//  Created by Roch on 29/03/2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var userType: UserType!
    var walkerService = WalkerService()
    var ownerService = OwnerService()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var dogNameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var experinceTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        label.text = userType == .owner ? "OWNER ACCOUNT" : "WALKER ACCOUNT"
        
        if userType == .owner {
            experinceTF.isHidden = true
            priceTF.isHidden = true
            dogNameTF.isHidden = false
        } else {
            experinceTF.isHidden = false
            priceTF.isHidden = false
            dogNameTF.isHidden = true
        }
    }
    
    // MARK: IBActions
    @IBAction func signUpHandler(_ sender: UIButton) {
        let fullName = fullNameTF.text ?? ""
        let dogName = dogNameTF.text ?? ""
        let phone = phoneTF.text ?? ""
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let experience = experinceTF.text ?? ""
        let price = priceTF.text ?? ""
        
        if userType == .owner{
            self.registerOwner(fullName: fullName, dogName: dogName, phone: phone, email: email, password: password)
        } else {
            self.registerWalker(fullName: fullName, experience: experience, price: price, phone: phone, email: email, password: password)
        }
        
    }
    
    @IBAction func loginHandler(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: Common Function
    func alert(message: String?, title: String? = nil, okAction: (()->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            okAction?()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func registerOwner(fullName:String, dogName:String, phone:String, email:String, password:String){
        if !(fullName.isEmpty || dogName.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
            ownerService.registerOwner(fullName: fullName, dogName: dogName, phone: phone, email: email, password: password){success, message, data in
                if success {
                    let defaults = UserDefaults.standard
                    defaults.set(email, forKey: "username")
                    defaults.set("owner", forKey: "userType")
                    
                    appDelegate.goToDashboardPage()
                } else {
                    self.alert(message: message, title: "Registration Failed", okAction: nil)
                }
                
            }
            
        } else {
            self.alert(message: "All fields are required", title: "Invalid fields", okAction: nil)
        }
    }
    
    func registerWalker(fullName:String, experience:String,price:String, phone:String, email:String, password:String){
        if !(fullName.isEmpty || experience.isEmpty || price.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
            walkerService.registerWalker(fullName: fullName, experience: experience, price: price, phone: phone, email: email, password: password){success, message, data in
                if success {
                    let defaults = UserDefaults.standard
                    defaults.set(email, forKey: "username")
                    defaults.set("walker", forKey: "userType")
                    
                    appDelegate.goToDashboardPage()
                } else {
                    self.alert(message: message, title: "Registration Failed", okAction: nil)
                }
                
            }
            
        } else {
            self.alert(message: "All fields are required", title: "Invalid fields", okAction: nil)
        }
    }
    
    
}
