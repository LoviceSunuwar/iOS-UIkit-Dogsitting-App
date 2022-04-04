//
//  OwnerMoreViewController.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

class OwnerMoreViewController: UIViewController {

    @IBOutlet weak var termButton: UIButton!
    @IBOutlet weak var policyButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StaticPageViewController") as! StaticPageViewController
        switch sender {
            
        case termButton:
            vc.endPoint = EStaticPage.termsAndCondition.rawValue
            break
        case policyButton:
            vc.endPoint = EStaticPage.privacyPolicy.rawValue
            break
        case aboutUsButton:
            vc.endPoint = EStaticPage.aboutUs.rawValue
            break
        default :
            break
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
}
