//
//  CustomTextField.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/31/22.
//

import UIKit

class UnderLineTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
