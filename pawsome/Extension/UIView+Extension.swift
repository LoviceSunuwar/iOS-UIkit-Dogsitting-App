//
//  CustomView.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/31/22.
//

import UIKit

extension UIView {

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.primaryColor.cgColor
        self.set(cornerRadius: 20)
    }
    
    func setRoundedBorder() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.primaryColor.cgColor
        self.rounded()
    }
    
    func rounded() {
        self.layer.masksToBounds = true
        self.set(cornerRadius: self.frame.height/2)
    }
    
    func set(cornerRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }

}
