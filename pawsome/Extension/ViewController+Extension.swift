//
//  ViewController+Extension.swift
//  Pawsome
//
//  Created by Roch on 3/31/22.
//

import UIKit

extension UIViewController {
    var window: UIWindow? {
        return (UIApplication.shared.delegate as! AppDelegate).window
    }
    
    func alert(message: String?, title: String? = nil, okAction: (()->())? = nil) {
        if type(of: topViewController()) == UIAlertController.self {
            return
        }
        let alertController = getAlert(message: message, title: title)
        alertController.addAction(title: "OK", handler: okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func topViewController() -> UIViewController? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var top = appDelegate.window?.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top
    }
    
    private func getAlert(message: String?, title: String?, style: UIAlertController.Style? = .alert) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: style ?? .alert)
    }
    
    func alertWithOkCancel(message: String?, title: String? = "Error", okTitle: String? = "OK", style: UIAlertController.Style? = .alert, cancelTitle: String? = "Cancel", okStyle: UIAlertAction.Style = .default, cancelStyle: UIAlertAction.Style = .default, okAction: (()->())? = nil, cancelAction: (()->())? = nil) {
        let alertController = getAlert(message: message, title: title, style: style)
        alertController.addAction(title: okTitle, style: okStyle, handler: okAction)
        alertController.addAction(title: cancelTitle, style: cancelStyle, handler: cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIAlertController {
    func addAction(title: String?, style: UIAlertAction.Style = .default, handler: (()->())? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: {_ in
            handler?()
        })
        self.addAction(action)
    }
}
