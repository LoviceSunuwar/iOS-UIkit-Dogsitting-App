//
//  Common+Extension.swift
//  Pawsome
//
//  Created by Roch on 04/04/2022.
//

import Foundation
extension String {
    func toDate(dateFormat: String = "yyyy-MM-dd HH:mm:ss'.000Z'") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: self)
        return date
    }
}

extension Date {
    
    func toFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "en_US")
        
        formatter.dateFormat = "EEE, dd MMM yyyy"
        let dateString = formatter.string(from: self)
        
        formatter.dateFormat = "hh:mm a"
        let timeString = formatter.string(from: self)
        
        let orderDateString = "\(dateString) at \(timeString)"
        return orderDateString
    }
}
