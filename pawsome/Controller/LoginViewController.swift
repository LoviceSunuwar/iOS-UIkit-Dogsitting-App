//
//  LoginViewController.swift
//  pawsome
//
//  Created by Roch on 27/03/2022.
//

import UIKit

class LoginViewController: UIViewController {
    var userType: UserType!
    var walkerService = WalkerService()
    var ownerService = OwnerService()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        titleLabel.text = userType == .walker ? "Walker Login" : "Owner Login"
    }
    
    // MARK: @IBAction
    @IBAction func login(_ sender: UIButton) {
        let userN:String = username.text ?? ""
        let pass:String = password.text ?? ""
        
        if(userType == .walker) {
            walkerLogin(username: userN, password: pass)
        } else {
            self.ownerLogin(username: userN, password: pass)
        }
    }
    
    
    @IBAction func registrationHandler(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        vc.userType = userType
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: Common Functions
    func ownerLogin(username:String, password:String){
        ownerService.login(email: username, password: password) { success, message, data in
            if success {
                // store username and password to check if user has logged in later
                let defaults = UserDefaults.standard
                defaults.set(data?.fullName, forKey: "username")
                defaults.set("owner", forKey: "userType")
                appDelegate.goToDashboardPage()
            } else {
                // show alert if username or password is incorrect
                self.alert(message: message, title: "Unauthorized", okAction: nil)
            }
        }
    }
    
    func walkerLogin(username:String, password:String){
        walkerService.login(email: username, password: password) { success, message, data in
            if success {
                // store username and password to check if user has logged in later
                let defaults = UserDefaults.standard
                defaults.set(username, forKey: "username")
                defaults.set("walker", forKey: "userType")
                
                appDelegate.goToDashboardPage()
            } else {
                // show alert if username or password is incorrect
                self.alert(message: message, title: "Unauthorized", okAction: nil)
            }
        }
    }
    
    func alert(message: String?, title: String? = nil, okAction: (()->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            okAction?()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
