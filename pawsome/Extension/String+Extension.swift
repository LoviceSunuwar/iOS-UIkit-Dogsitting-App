//
//  String+Extension.swift
//  Pawsome
//
//  Created by Nhuja Shakya on 3/31/22.
//

import Foundation


extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isPhoneNumber: Bool {
//        let phoneRegEx = "98+[0-9]{8}"
//        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
//        return phoneTest.evaluate(with: self)
        
        let phoneRegEx = "9+[0-9]{9}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
}
