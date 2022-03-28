//
//  ViewController.swift
//  pawsome
//
//  Created by Lovice Sunuwar on 22/03/2022.
//

import UIKit

class ChooseUserController: UIViewController {
    @IBOutlet weak var chooseOwnerButton: UIButton!
    @IBOutlet weak var chooseWalkerBtn: UIButton!
    
    var service = WalkerService()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    @IBAction func chooseUser(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        switch sender {
        case chooseOwnerButton:
            vc.userType = .owner
            self.navigationController?.pushViewController(vc, animated: true)
        case chooseWalkerBtn:
            vc.userType = .walker
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    


}

