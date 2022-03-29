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
    
    
    @IBAction func login(_ sender: UIButton) {
        let userN:String = username.text ?? ""
        let pass:String = password.text ?? ""
        
        if(userType == .walker){
            walkerService.login(email: userN, password: pass) { success, message, data in
                if success {
                    print("Login Success", message)
                    // store username and password to check if user has logged in later
                    let defaults = UserDefaults.standard
                    defaults.set(userN, forKey: "username")
                    defaults.set("walker", forKey: "userType")
                    
                    appDelegate.goToDashboardPage()
                } else {
                    print("Login Failed", message)
                }
            }
        } else {
            ownerService.login(email: userN, password: pass) { success, message, data in
                if success {
                    print("Login Success", message)
                    // store username and password to check if user has logged in later
                    let defaults = UserDefaults.standard
                    defaults.set(data?.fullName, forKey: "username")
                    defaults.set("owner", forKey: "userType")
                    appDelegate.goToDashboardPage()
                } else {
                    print("Login Failed", message)
                }
            }
        }
        
        
    }
    
    
    @IBAction func registrationHandler(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        vc.userType = userType
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
