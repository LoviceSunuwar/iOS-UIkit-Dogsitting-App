//
//  AppDelegate.swift
//  pawsome
//
//  Created by Lovice Sunuwar on 22/03/2022.
//

import UIKit

let deploymentMode: DeploymentMode = .local

/// GLOBAL VARIABLE CREATED
var appDelegate: AppDelegate {
    return (UIApplication.shared.delegate as! AppDelegate)
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let defaults = UserDefaults.standard
        let username = defaults.value(forKey: "username")
        let userType = defaults.value(forKey: "userType")
        if username != nil {
            if ((userType as! String).lowercased()) == "owner" {
                goToOwnerDashboardPage()
            } else {
                goToWalkerDashboardPage()
            }
            
        }
        return true
    }
    
    // To Change root vc to login (call when logout)
    func goToLoginPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InitialNavigation") as! UINavigationController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    // To Change root vc to main walker page (call when login)
    func goToWalkerDashboardPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WalkerNavigation") as! UITabBarController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    // To Change root vc to main owner page (call when login)
    func goToOwnerDashboardPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OwnerNavigation") as! UITabBarController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    
}

