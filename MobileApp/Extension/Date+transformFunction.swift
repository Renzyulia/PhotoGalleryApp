//
//  Date+transformFunction.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 25.04.2022.
//

import UIKit

extension Date {
    func transform() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: self)
    }
}
