//
//  AppDelegate.swift
//  Pawsome
//
//  Created by Roch on 3/22/22.
//

import UIKit

let deploymentMode: DeploymentMode = .uat

var appDelegate: AppDelegate {
    return (UIApplication.shared.delegate as! AppDelegate)
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
//        if NSLoginManager.isLoggedIn() {
//            if NSLoginManager.isOwner() {
//                goToOwnerDashboardPage()
//            } else {
//                goToWalkerDashboardPage()
//            }
//        }
        return true
    }
    
    
    func application(
      _ app: UIApplication,
      open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
      return false
    }
    
    // To Change root vc to main walker page (call when login)
    func goToWalkerDashboardPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WalkerDashboardTabController") as! UITabBarController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    // To Change root vc to main owner page (call when login)
    func goToOwnerDashboardPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OwnerDashboardTabController") as! UITabBarController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
    func goToWalkthroughNavigationControllerPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WalkthroughNavigationController") as! UINavigationController
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}

