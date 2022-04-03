//
//  UIView+Extension.swift
//  Pawsome
//
//  Created by Shivam Saini on 2022-04-02.
//

import Foundation
import UIKit

extension UIView{
   @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
