//
//  WalkerMoreViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class WalkerMoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        self.alertWithOkCancel(message: "Are you sure you want to logout", title: "Alert", okTitle: "Logout", style: .alert, cancelTitle: "Cancel", okStyle: .destructive, cancelStyle: .default, okAction: {
            NSLoginManager.clearLogSessions()
            appDelegate.goToWalkthroughNavigationControllerPage()
        }, cancelAction: nil)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
