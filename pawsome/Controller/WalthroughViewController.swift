//
//  ViewController.swift
//  Pawsome
//
//  Created by Roch on 3/22/22.
//

import UIKit

class WalthroughViewController: UIViewController {
    @IBOutlet weak var walkerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walkerButton.setRoundedBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func ownerButtonTapped(_ sender: Any) {
        goToLogin(userType: .owner)
    }
    
    @IBAction func walkerButtonTapped(_ sender: Any) {
        goToLogin(userType: .walker)
    }
    
    
    func goToLogin(userType: EUserType) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        GlobalConstants.KeyValues.userType = userType
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

