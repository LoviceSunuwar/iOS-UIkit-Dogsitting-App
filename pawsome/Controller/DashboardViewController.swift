//
//  DashboardViewController.swift
//  pawsome
//
//  Created by Roch on 28/03/2022.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let username = defaults.value(forKey: "username")
        let userType = defaults.value(forKey: "userType")
        label.text = "Welcome " + (username as? String ?? "") + "(\((userType as! String).uppercased()))"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logoutHandler(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "username")
        appDelegate.goToLoginPage();
    }
    
}
